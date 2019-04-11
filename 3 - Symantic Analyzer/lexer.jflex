package cup.example;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import java_cup.runtime.Symbol;
import java.lang.*;
import java.io.InputStreamReader;

%%

%class Lexer
%extends sym
%public
%unicode
%line
%column
%cup
%char
%{


    public Lexer(ComplexSymbolFactory sf, java.io.InputStream is){
		this(is);
        symbolFactory = sf;
    }
	public Lexer(ComplexSymbolFactory sf, java.io.Reader reader){
		this(reader);
        symbolFactory = sf;
    }

    private StringBuffer sb;
    private ComplexSymbolFactory symbolFactory;
    private int csline,cscolumn;

    public Symbol symbol(String name, int code){
		return symbolFactory.newSymbol(name, code,
						new Location(yyline+1,yycolumn+1, yychar), // -yylength()
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength())
				);
    }
    public Symbol symbol(String name, int code, String lexem){
	return symbolFactory.newSymbol(name, code,
						new Location(yyline+1, yycolumn +1, yychar),
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength()), lexem);
    }

    protected void emit_warning(String message){
    	System.out.println("scanner warning: " + message + " at : "+
    			(yyline) + " " + (yycolumn) + " " + yychar);
    }

    protected void emit_error(String message){
    	System.out.println("scanner error: " + message + " at : " +
    			(yyline) + " " + (yycolumn) + " " + yychar);
    }
%}

Newline    = \r | \n | \r\n
Whitespace = [ \t\f] | {Newline}

identifier				= [a-zA-Z][a-zA-Z0-9\_]*

zero					= 0
unsignedInteger			= [1-9][0-9]*
signedInteger			= ([-]|[+]){unsignedInteger}
hexadecimal				= 0[xX][0-9a-fA-F]+
integer					= (([-]|[+])?{zero} | {unsignedInteger} | {signedInteger} | {hexadecimal})

real					= ({unsignedInteger}|{signedInteger})[.][0-9]* | ([-]|[+])?{zero}*{unsignedInteger}?[.][0-9]* | [.][0-9]+ | {zero}[.][0-9]*



text					= [^\"]
string					= [\"](([\%][\"])|{text})*[\"]

%eofval{
    return symbolFactory.newSymbol("EOF",sym.EOF);
%eofval}

%state CODESEG

%%

<YYINITIAL> {

  {Whitespace} {                              }
  "class"		{ return symbolFactory.newSymbol("CLASS", CLASS); }
  "feature"		{ return symbolFactory.newSymbol("FEATURE", FEATURE); }
  "create"		{ return symbolFactory.newSymbol("CREATE", CREATE); }
  "local"		{ return symbolFactory.newSymbol("LOCAL", LOCAL); }
  "from"		{ return symbolFactory.newSymbol("FROM", FROM); }
  "until"		{ return symbolFactory.newSymbol("UNTIL", UNTIL); }
  "loop"		{ return symbolFactory.newSymbol("LOOP", LOOP); }
  "do"			{ return symbolFactory.newSymbol("DO", DO); }
  "if"			{ return symbolFactory.newSymbol("IF", IF); }
  "then"		{ return symbolFactory.newSymbol("THEN", THEN); }
  "else"		{ return symbolFactory.newSymbol("ELSE", ELSE); }
  "end"			{ return symbolFactory.newSymbol("END", END); }
  "print"		{ return symbolFactory.newSymbol("PRINT", PRINT); }
  "INTEGER"		{ return symbolFactory.newSymbol("INTEGER", INTEGER); }
  "STRING"		{ return symbolFactory.newSymbol("STRING", STRING); }
  "REAL"		{ return symbolFactory.newSymbol("REAL", REAL); }
  {string}		{ return symbolFactory.newSymbol("STRING_LITERAL", STRING_LITERAL, yytext()); }
  {identifier}	{ return symbolFactory.newSymbol("IDENTIFIER", IDENTIFIER, yytext()); }
  {integer}		{ return symbolFactory.newSymbol("INTEGER_LITERAL", INTEGER_LITERAL, new Integer(yytext())); }
  {real}		{ return symbolFactory.newSymbol("REAL_LITERAL", REAL_LITERAL,new Float(yytext())); }
  "("			{ return symbolFactory.newSymbol("LPAREN", LPAREN); }
  ")"			{ return symbolFactory.newSymbol("RPAREN", RPAREN); }
  "<"			{ return symbolFactory.newSymbol("LT", LT); }
  ">"			{ return symbolFactory.newSymbol("GT", GT); }
  "<="			{ return symbolFactory.newSymbol("LTEQ", LTEQ); }
  ">="			{ return symbolFactory.newSymbol("GTEQ", GTEQ); }
  "+"			{ return symbolFactory.newSymbol("PLUS", PLUS); }
  "-"			{ return symbolFactory.newSymbol("MINUS", MINUS); }
  "/"			{ return symbolFactory.newSymbol("DIV", DIV); }
  "*"			{ return symbolFactory.newSymbol("MULT", MULT); }
  ":"			{ return symbolFactory.newSymbol("COLON", COLON); }
  ":="			{ return symbolFactory.newSymbol("COLEQ", COLEQ); }
  ";"			{ return symbolFactory.newSymbol("SEMICOLON", SEMICOLON); }
  ","			{ return symbolFactory.newSymbol("COMMA", COMMA); }
}



// error fallback
.|\n          { emit_warning("Unrecognized character '" +yytext()+"' -- ignored"); }
