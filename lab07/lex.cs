using System;
using System.Collections.Generic;

/**
 * This lab is the FIRST part of a parser lab.  This week we focus on lexing.
 * Eventually, we will build a parser for a simple language that supports assignments
 *     var = expr
 * Typeing an expression by itself will display the value of the expression
 *
 * Tokens:
 *      ID:  Any letter followed be a sequence of letters and numbers
 *      REAL: An optional sign followed by a sequence of digits, optionally with single decimal point.
 *      WS:  Whitespace (no tokens generated, this is skipped)
 *      LPAREN, RPAREN, EQUALS:  (, ), and = literals
 *      OP_PLUS, OP_MINUS: + and - literals
 *      OP_MULTIPLY, OP_DIVIDE:  * and / literals
 *      OP_EXPONENT: ** literal (x**2 is "x squared").
 *              LIT: (,), = + - * / **
 *Grammar:
 *      <stmt> ::= <assign> | <expr>
 *      <assign> ::= ID = <expr>
 *      <expr> ::= <term> | <term> + <expr> | <term> - <expr>
 *      <term> ::= <factor> | <factor> * <term> | <factor> / <term>
 *      <factor> ::= <base>**<factor> | <base>
 *      <base> := ID | NUM |  (<expr>)
 */
public class ExpressionParser {

    public enum Symbol
    {
                INVALID,
                ID,
                NUM,
                LITERAL,
                WS
    }

    /**
     * Represents a node in a parse tree.
     * - Should keep track of the 'text' of the node (the substring under the node)
     * - Should keep track of the line and column where the node begins.
     * - Should keep track of the children of the node in the parse tree
     * - should keep track of the Symbol (see the enum) corresponding to the node
     * - Tokens are leaf nodes (the array of children should be null)
     * - Needs a constructor with symbol, text, line, and column
     **/
    public class Node{
                public readonly string Text;
                public readonly int Line;
                public readonly int Column;
                private List<Node> children;
                public readonly Symbol Token;

                /**
                * Constructor for lexemes / leaf nodes of the parse tree
                **/

                public Node (Symbol token, string text, int line, int column) {
                        Token = token;
                        Text = text;
                        Line = line;
                        Column = column;
                        children = new List<Node>();
                }
    }

    /**
     * Generator for tokens.
     * Use 'yield return' to return tokens one at a time.
     **/

    public static IEnumerable<Node> tokenize(System.IO.StreamReader src)
    {
        int line = 1;
        int column = 1;
        System.Text.StringBuilder lexeme = new System.Text.StringBuilder();

                int state = 0;
                Symbol token = Symbol.INVALID;

                while (!src.EndOfStream) {
                        char c = (char)src.Peek();
                        switch(state) {
                                case 0: // start
                                        if (c == '\n') {
                                                line++;
                                                column = 1;
                                                src.Read();
                                                token = Symbol.WS;
                                        } else if (char.IsWhiteSpace(c)) {
                                                src.Read();
                                                column++;
                                                token = Symbol.WS;
                                        } else if (c == '+' || c == '-') {
                                                state = 1;
                                                token = Symbol.LITERAL;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else if (char.IsDigit(c)) {
                                                state = 2;
                                                token = Symbol.NUM;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else if (c == '*') {
                                                state = 4;
                                                token = Symbol.LITERAL;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else if (char.IsLetter(c) || c == ' ') {
                                                state = 6;
                                                token = Symbol.ID;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else if (c == '=' || c == '(' || c == ')') {
                                                state = 5;
                                                token = Symbol.LITERAL;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else {
                                                throw new Exception($"Invalid character '{c}' at line {line} column {column}");
                                        }
                                        break;

                                case 1:
                                        if (char.IsDigit(c)) {
                                                state = 2;
                                                token = Symbol.NUM;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else {
                                                yield return new Node(token, lexeme.ToString(), line, column);
                                                lexeme.Clear();
                                                state = 0;
                                                token = Symbol.WS;
                                        }
                                        break;
								case 2:
                                        if (char.IsDigit(c)) {
                                                state = 2;
                                                token = Symbol.NUM;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else if (c == '.') {
                                                state = 3;
                                                token = Symbol.NUM;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else {
                                                yield return new Node(token, lexeme.ToString(), line, column);
                                                lexeme.Clear();
                                                state = 0;
                                                token = Symbol.WS;
                                        }
                                        break;
								case 3:
                                        if (char.IsDigit(c)) {
                                                state = 3;
                                                token = Symbol.NUM;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else {
                                                yield return new Node(token, lexeme.ToString(), line, column);
                                                lexeme.Clear();
                                                state = 0;
                                                token = Symbol.WS;
                                        }
                                        break;
								case 4:
                                        if (c == '*') {
                                                state = 5;
                                                token = Symbol.LITERAL;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else {
                                                yield return new Node(token, lexeme.ToString(), line, column);
                                                lexeme.Clear();
                                                state = 0;
                                                token = Symbol.WS;
                                        }
                                        break;
								case 5:
										yield return new Node(token, lexeme.ToString(), line, column);
										lexeme.Clear();
										state = 0;
										token = Symbol.WS;
                                        break;
								case 6:
                                        if (char.IsLetterOrDigit(c) || c == '_') {
                                                state = 6;
                                                token = Symbol.ID;
                                                lexeme.Append(c);
                                                src.Read();
                                                column++;
                                        } else {
                                                yield return new Node(token, lexeme.ToString(), line, column);
                                                lexeme.Clear();
                                                state = 0;
                                                token = Symbol.WS;
                                        }
                                        break;
                        }
                }

                if (token != Symbol.INVALID) {
                        yield return new Node(token, lexeme.ToString(), line, column);
                }
    }


    public static void Main(string[] args){
        try {
                        System.IO.Stream stream;
                        //stream = Console.OpenStandardInput()

                        bool testing = false;
                        if(testing) {
                                string testText = "+ 3.14 x banana = (3+2)**4";
                                stream = new System.IO.MemoryStream(System.Text.Encoding.ASCII.GetBytes(testText));
                        } else {
                                stream = Console.OpenStandardInput();
                        }

            foreach (Node n in tokenize(new System.IO.StreamReader(stream))){
                                Console.WriteLine($"{n.Token, -20}\t{n.Text}");
                //Console.WriteLine($"{Enum.GetName(typeof(Symbol), n.symbol),-15}\t{n.text}");
            }
        } catch (Exception e){
            Console.WriteLine(e.Message);
        }
    }
}
