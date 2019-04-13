/*
 * A VERY minimal skeleton for your parser, provIDed by Emma Norling.
 *
 * Your parser should use the tokens provIDed by your lexer in rules.
 * Even if your lexer appeared to be working perfectly for stage 1,
 * you might need to adjust some of those rules when you implement
 * your parser.
 *
 * Remember to provIDe documentation too (including replacing this
 * documentation).
 *
 */
parser grammar DecafParser;
options { tokenVocab = DecafLexer; }

// This rule says that a program consists of the tokens CLASS  LCURLY RCURLY EOF nothing more nothing less,
// in exactly that order. However obviously something (quite a lot of something) needs to go between the curly
// brackets. You need to write the rules (based on the provIDed grammar) to capture this.

program: CLASS id LCURLY field_decl* method_decl*.RCURLY EOF;

id: alpha alpha_num*;

method_decl: LCURLY type | VOID RCURLY  LBRACKET LSQUBRACKET LCURLY type  RCURLY*RSQUBRACKET RBRACKET block;

field_decl: type LCURLY  |  LSQUBRACKET int_literal RSQUBRACKET RCURLY*;

int_literal: DIGIT;	
		     
hex_literal: HEXDIGIT*;		     

block: LCURLY var_decl* statement* .RCURLY;

var_decl: type *;

decimal_literal: DIGIT DIGIT*;

type: INTEGER | BOOLEAN;

expr: location | method_call | literal | expr bin_op expr | SUBTRACT expr | NOT expr | LCURLY expr RCURLY;

statement: location assign_op expr | method_call | IF LBRACKET expr RBRACKET block LSQUBRACKET ELSE block RSQUBRACKET | FOR id EQUAL expr expr block | RETURN LSQUBRACKET expr RSQUBRACKET | BREAK | CONTINUE | block;

location:  |  LSQUBRACKET expr RSQUBRACKET;		   
		   
assign_op: EQUAL | ADD EQUAL | SUBTRACT EQUAL;

method_call: method_name LCURLY LSQUBRACKET expr* RSQUBRACKET LCURLY | callout_arg LCURLY string_literal LSQUBRACKET expr* RSQUBRACKET LBRACKET;

method_name: id;	   

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: ADD | SUBTRACT | MULTIPLY | DIVIDE | PERCENT;

rel_op: LESSTHAN | GREATERTHAN | LESSTHANEQUALTO | GREATERTHANEQUALTO;

eq_op: EQUAL | NOTEQUAL;

cond_op: AND | |;

literal: int_literal | char_literal | bool_literal;

alpha_num: alpha | DIGIT;

alpha: id;

bool_literal: TRUE | FALSE;

char_literal: CHAR;

string_literal: CHAR*;