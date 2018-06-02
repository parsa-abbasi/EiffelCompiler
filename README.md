# EiffelCompiler
Explore the principal ideas and techniques of compiler construction based on Eiffel programming language

## Eiffel
Eiffel is an object-oriented programming language designed by Bertrand Meyer (an object-orientation proponent and author of Object-Oriented Software Construction) and Eiffel Software. Meyer conceived the language in 1985 with the goal of increasing the reliability of commercial software development; the first version becoming available in 1986. In 2005, Eiffel became an ISO-standardized language. ([wikipedia](https://en.wikipedia.org/wiki/Eiffel_(programming_language)))

## Phases
### Phase1 - Lexical analyzer
Following tokens must be recognized :

**1. Five keywords**
```
e.g. "feature" | "class" | "do" | "end" | "INTEGER" | "STRING" | "REAL"
some other examples :
"alias" | "assign" | "once" | "inherit" | "redefine" | "if" | "create" | "else" | "require" | "ensure" | "local" | "BOOLEAN" | "DOUBLE" | ...
```
**2. Identifier**
```
Identifier is a sequence of one or more alphanumeric characters of which the first is letter.
The words of an identifier can be separated by "_" in Eiffel. 
For example its_an_identifier
```
**3. Integer literal**
```
e.g. -868, +862542, 2450, 0, 0x34A, +0, ...
```
**4. Floating point literal**
```
e.g. 0.98, .985, 56.0, +0.95, -10.95657875, -0.85, -0.00, ...
```
**5. String literal**
```
String started and finished with quotation mark in Eiffel.
Note: We can have quotation mark in our string with [%"] (Merely in Eiffel)
e.g. "Hello"
```
**6. White Space**
```
New line and white space
e.g "	left tab"
```
**7. Delimiters (such as “(“, “)”, “[“, …)**
```
e.g. "(" , ")" , "{" , "}" , "[" , "]" , "|" , "'" , [\"]
```
**8. Operators**
```
*  Logic operators - e.g. "and" , "or" , "xor" , "not"
*  Semistrict logic operators - e.g. "and then" , "or else" , "implies"
*  Comparison operators - e.g. "<" , ">" , "<=" , ">="
*  Mathematical operators - e.g. "+" , "-" , "*" , "/"
*  Some other stuff - e.g. ":=" , "=" , "/=" , "//" , "\\" , "^" , ".." , "|..|" 
```
**9. Comment**
```
Comments started with "--"
e.g. -- this is a comment
```
The lexical analyzer must be able to get an input file that is to be scanned and all recognized tokens must be printed in console along with the line number and column number in which the token is detected.
### Phase2 - Syntactic analyzer
/*Coming soon!*/
## Authors
* **Parsa Abasi** [[Github profile]](https://github.com/parsapersian96)
* **Hamed Faraji** [[Github profile]](https://github.com/hamed-faraji)

See also the list of [contributors](https://github.com/parsapersian96/EiffelCompiler/contributors) who participated in this project.

## Course
Compiler Design - University of Guilan

Instructor: **Abdollah Esmaeilpour** [[Linkedin page]](https://ir.linkedin.com/in/abdollah-e)

## Useful Sources
Official Website of Eiffel : [www.Eiffel.org](https://www.eiffel.org)

Eiffel Syntax Guide : [www.Eiffel-Guide.com](http://eiffel-guide.com)