using System;
using System.Collections.Generic;

public class LispishParser
{

    public enum Symbol {
	LITERAL,
	REAL,
	INT,
	STRING,
	ID,
	WS,
	INVALID
    }

    public class Node
    {
	public readonly string Text;
	public readonly int Line;
	public readonly int Column;
	private List<Node> children;
	public readonly Symbol Token;

	public Node(Symbol token, string text, int line, int column) {
		Token = token;
		Text = text;
		Line = line;
		Column = column;
		children = new List<Node>();
	}


        public void Print(string prefix = "")
        {
		Console.WriteLine($"{Token, -20}\t{Text}");
        }
    }

    static public List<Node> Tokenize(String src)
    {
	int line = 1;
	int column = 1;
	int state = 0;
	Symbol token = Symbol.INVALID;
	string srcToRead = src;

	Regex rgxLiteral = new Regex(@"[\(\)]");
	Regex rgxReal = new Regex(@"[+-]?[0-9]*\.[0-9]+");
	Regex rgxInt = new Regex(@"[+-]?[0-9]+");
	Regex rgxString = new Regex(@"");
	Regex rgxID = new Regex(@"");
	


	while (!src.EndOfStream) {
		char c = (char)src.Peek();
		if (rgxLiteral.IsMatch(srcToRead)) {
			
		} else if (rgxReal.Match("")) {

		} else if (rgxInt.Match("")) {

		} else if (rgxString.Match("")) {

		} else if (rgxID.Match("")) {

		}
	}
    }

    static public Node Parse(Node[] tokens)
    {
        return null;
    }

    static private void CheckString(string lispcode)
    {
        try
        {
            Console.WriteLine(new String('=', 50));
            Console.Write("Input: ");
            Console.WriteLine(lispcode);
            Console.WriteLine(new String('-', 50));

            Node[] tokens = Tokenize(lispcode).ToArray();

            Console.WriteLine("Tokens");
            Console.WriteLine(new String('-', 50));
            foreach (Node node in tokens)
            {
		    node.Print();
            }
            Console.WriteLine(new String('-', 50));

            Node parseTree = Parse(tokens);

            Console.WriteLine("Parse Tree");
            Console.WriteLine(new String('-', 50));
            parseTree.Print();
            Console.WriteLine(new String('-', 50));
        }
        catch (Exception)
        {
            Console.WriteLine("Threw an exception on invalid input.");
        }
    }


    public static void Main(string[] args)
    {
        //Here are some strings to test on in 
        //your debugger. You should comment 
        //them out before submitting!

        // CheckString(@"(define foo 3)");
        // CheckString(@"(define foo ""bananas"")");
        // CheckString(@"(define foo ""Say \\""Chease!\\"" "")");
        // CheckString(@"(define foo ""Say \\""Chease!\\)");
        // CheckString(@"(+ 3 4)");      
        // CheckString(@"(+ 3.14 (* 4 7))");
        // CheckString(@"(+ 3.14 (* 4 7)");

        CheckString(Console.In.ReadToEnd());
    }
}

