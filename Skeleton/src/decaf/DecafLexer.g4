/*
 * this is the class for the decaf lexer.
 */
lexer grammar DecafLexer;

// This rule matches one of the keywords for Decaf - what others do you need?
// boolean keyword changed to BOOLEAN
BOOLEAN : 'boolean';
// program keyword changed to PROGRAM
PROGRAM : 'Program';
// break keyword changed to BREAK
BREAK : 'break';
// class changed to CLASS
CLASS : 'class';
// continue changed to CONTINUE
CONTINUE : 'continue';
// else changed to ELSE
ELSE : 'else';
// false changed to FALSE
FALSE : 'false';
// for changed to FOR
FOR : 'for';
// if changed to IF
IF : 'if';
// integer changed to INTEGER
INTEGER : 'integer';
//return changed to RETURN
RETURN : 'return';
// true changed to TRUE
TRUE : 'true';
// void changed to VOID 
VOID : 'void';


// These two rules deal with characters that have special meaning in Decaf - again, what others?

// Left curly bracket
LCURLY : '{';
// Right curly bracket
RCURLY : '}';
// Left square bracket 
LSQUBRACKET: '[';
// right square bracket
RSQUBRACKET: ']';
// left bracket
LBRACKET : ')';
// right bracket
RBRACKET : '(';
//greater than symbol
GREATERTHAN : '>';
// less than symbol
LESSTHAN: '<';
// less than or equal to symbol
LESSTHANEQUALTO : '<=';
//greater than equal to symbol
GREATERTHANEQUALTO : '>=';
// And symbol
AND : '++';
// Or symbol
OR : '||';
// End symbol
END : ';';
// Equal symbol
EQUAL : '=';
// not equal symbol
NOTEQUAL : '!=';
// not symbol
NOT : '!';
// add symbol
ADD : '+';
// subtract symbol
SUBTRACT : '-';
//multiply symbol
MULTIPLY : '*';
// divide symbol
DIVIDE : '/';
// percent symbol
PERCENT : '%';


// This says an identifier is a sequence of one or more alphabetic characters
// Decaf is a little more sophisticated than this.

  
  ID : ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '_' | '0'..'9')*;


// This rule simply ignores (skips) any space or newline characters


WS_ : (' ' | '\n' ) -> skip;



// And this rule ignores comments (everything from a '//' to the end of the line)


SL_COMMENT : '//' (~'\n')* '\n' -> skip;


// These two rules incompletely describe characters and strings, and make use of the ESC fragment described below
// This rule says a character is contained within single quotes, and is a single instance of either an ESC, or any
// character other than a single quote.


CHAR : '\'' (ESC|~'\'') '\'';	

HEX : DIGIT (HEXDIGIT)+;

DECIMAL: (DIGIT)+;

DIGIT : '0'..'9';

HEXDIGIT : DIGIT | 'a'..'f' | 'A'..'F';


// This rule says a string is contained within double quotes, and is zero or more instances of either an ESC, or any
// character other than a double quote.


STRING : '"' (ESC|~'"')* '"';


// A rule that is marked as a fragment will NOT have a token created for it. So anything matching the rules above
// will create a token in the output, but something matching the ESC rule below will only be used locally in the scope
// of this file. Any rule that should not generate an output token should be preceded by the fragment keyword.
// ESC matches either a pair of characters representing a newline ('\' and 'n') or a pair of characters representing
// a double quote ('\' and '"'). HINT: there are many other characters that should be escaped - think of how you need
// to write them in strings in languages like Java.
fragment


ESC :  '\\' ('n'|'"');
