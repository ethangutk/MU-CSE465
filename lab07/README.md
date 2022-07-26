# Lab 7

 # Description
 This lab is the FIRST part of a parser lab.  This week we focus on lexing. 
 Eventually, we will build a parser for a simple language that supports assignments
 ```
      a = b*(c + d)**2
 ```
where the `**` operator is exponentiation. 
In a final system. typeing an expression by itself will display the value of the expression.
However for this lab, we are only focusing ont he tokenizer. 


 Tokens:
 - `ID`:  Any letter followed be a sequence of letters and numbers  
 - `NUM`: An optional sign followed by a sequence of digits, optionally with single decimal point.   
 - `LIT`: Any literal symbol  
 - `WS`:  Whitespace (no tokens generated, this is skipped)  

 Grammar:
 ```
      <stmt> ::= <assign> | <expr>
      <assign> ::= ID = <expr> 
      <expr> ::= <term> {(+|-) <term>}
      <term> ::= <factor> { (*|/) <factor> }
      <factor> ::= <base>[**<factor>]
      <base> := ID | NUM |  (<expr>)
 ```

The lexer uses a state diagram indicated in this image:

![State Diagram](diagram.png)

In the image, whenever you move from one state to another you add the character on the edge to the lexeme, and you move to the next character of input. The exceptions are `WS`, which you do not add to the lexeme, and `ε`, which represents "no character" and you only transition on it when no other match is available. It causes no character to be read from the input or added to the lexeme. 

Watch the lecture for a description, I will do the whole lab and you just need to follow along. 

# Testing Your Work

1. Make sure you have access to a csaharp compile (preferably the latest one )
2. Please check on course discussion for any messages tagged 'lab07' to make sure you did not miss an important update
3. Type `make check` to test your work.  There should be no errors or warnings.
4. Make sure that your program completes within the time limit for this assignment (e.g. 60 seconds)
5. Type `make submit` or manually commit and push your changes to submit your work. 