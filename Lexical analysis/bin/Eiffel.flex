
%%
/* Declarations	*/

%{
	public void print (int line, int coloumn, String type, String text){
		System.out.println("L" + (line+1) + "|C" + (coloumn+1) + " --> " + type + " found: " + text);
	} /* It's just an print function */
%}

%class EiffelLexical
%standalone
%line
%column

keyword					= "feature" | "class" | "do" | "end" | "INTEGER" | "STRING" | "REAL"
/* Other example of keywords :
 	"alias" | "assign" | "once" | "inherit" | "redefine" | "if" | "create" | "else" | "require" | "ensure" | "local" | "BOOLEAN" | "DOUBLE" */

identifier				= [a-zA-Z][a-zA-Z0-9\_]*
/* A sequence of one or more alphanumeric characters of which the first is letter */
/* In Eiffel, the words of an identifier can be separated by "_". for example its_an_identifier */

zero					= 0
unsignedInteger			= [1-9][0-9]*
signedInteger			= ([-]|[+]){unsignedInteger}
hexadecimal				= 0[xX][0-9a-fA-F]+
integer					= (([-]|[+])?{zero} | {unsignedInteger} | {signedInteger} | {hexadecimal})
/* Different kind of integers */

real					= ({unsignedInteger}|{signedInteger})[.][0-9]* | ([-]|[+])?{zero}*{unsignedInteger}?[.][0-9]* | [.][0-9]+ | {zero}[.][0-9]*
/* Different kind of real numbers */

text					= [^[\"]]
string					= [\"](([\%][\"])|{text})*[\"]
/* In Eiffel, String started and finished with quotation mark */
/* Note: We can write quotation mark in our string with [%"] (Merely in Eiffel) */

newline					= \n
whitespace				= [\t ]+
/* New line and white space recognition */

delimiter				= "(" | ")" | "{" | "}" | "[" | "]" | "|" | "'" | [\"]
/* Different kind of delimiters */

logicOperators 			= "and" | "or" | "xor" | "not"
semistrictLogicOperators= "and then" | "or else" | "implies"
specialOperator			= {logicOperators} | {semistrictLogicOperators}
/* We have a few special operator like "and" or "not" that must have upper rank than identifier */

comparisonOperators		= "<" | ">" | "<=" | ">="
mathematicalOperators	= "+" | "-" | "*" | "/"
operator 				= ":=" | "=" | "/=" | "//" | "\\" | "^" | ".." | "|..|" | {comparisonOperators} | {mathematicalOperators}
/* Different kind of operators */

comment					= [-][-](.)*
/* In Eiffel comments started with "--". for example --comment */

%%
/* Rules */
{keyword}			{print(yyline, yycolumn, "Keyword", yytext());}
{specialOperator}	{print(yyline, yycolumn, "Operator", yytext());}
{identifier}		{print(yyline, yycolumn, "Identifier", yytext());}
{integer}			{print(yyline, yycolumn, "Integer", yytext());}
{real}				{print(yyline, yycolumn, "Real", yytext());}
{string}			{print(yyline, yycolumn, "String", yytext());}
{whitespace} 		{print(yyline, yycolumn, "White Space", yytext());}
{newline}			{} /* skip new lines */
{delimiter}			{print(yyline, yycolumn, "Delimiter", yytext());}
{operator}			{print(yyline, yycolumn, "Operator", yytext());}
{comment}			{print(yyline, yycolumn, "Comment", yytext());}