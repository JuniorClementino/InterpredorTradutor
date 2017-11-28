grammar Basic;

@header{
package basicintast.parser;
import basicintast.util.*;
}

program : PROGRAM STR EOL var? procedure?        #programStmtBegin
        | PROGRAM STR EOL start                       #programStmt
        ;
var     : VAR varnames ':' type EOL  var
        | start
        ;
type    : INT
        | FLOAT
        | BOOLEAN
        ;
varnames    : varname ',' varnames  
            | varname               
            ;

varname     : VARNAME   #varName
            ;
procedure   :
            ;

start   : BEGIN (stmt)+ ENDP
        ;

stmt    : write EOL             #stmtPrint
        | readln  EOL           #stmtRead
        | attr  EOL             #stmtAttr
        | expr  EOL             #stmtExpr
        | cond                  #stmtCond
        ;

cond    : IF '('condExpr')' THEN  b1=block                   #ifStmt
        | IF '('condExpr')' THEN  b1=block ELSE b2=block     #ifElseStmt 
        ;


condExpr: expr                                              #condExpresion
        | expr relop=('>'|'<'|'=='|'>='|'<='|'!=') expr     #condRelOp
        ;

block   : '{' program '}'   #blockStmt
        ;

write   : WRITE STR         #printStr
        | WRITE expr        #printExpr
        ;

readln    : READLN VARNAME          #readVar
        ;

attr    : VARNAME '=' expr      #attrExpr
        ;

expr    : expr1 '+' expr    #exprPlus
        | expr1 '-' expr    #exprMinus
        | expr1             #expr1Empty
        ;

expr1   : expr2 '*' expr    #expr1Mult
        | expr2 '/' expr    #expr1Div
        | expr2             #expr2Empty
        ;

expr2   : '(' expr ')'      #expr2Par
        | NUM               #expr2Num
        | VARNAME               #expr2Var
        ;

fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');


//TOKENS
IF      : I F ;
BEGIN   : B E G I N ;
END     : E N D ;
ENDP    : E N D '.' ;
ELSE    : E L S E ;
THEN    : T H E N ;
WRITE   : W R I T E ;
WRITELN : W R I T E L N ;
READLN  : R E A D L N ;
INT     : I N T E G E R ;
FLOAT   : F L O A T ;
BOOLEAN : B O O L E A N ;
STRING  : S T R I N G ;
FOR     : F O R ;
WHILE   : W H I L E ;
ARRAY   : A R R A Y ;
VAR     : V A R ;
PROGRAM : P R O G R A M ;

GT      : '>' ;
LT      : '<' ;
EQ      : '==';
GE      : '>=';
LE      : '<=';
NE      : '!=';
PLUS    : '+' ;
MINUS   : '-' ;
MULT    : '*' ;
DIV     : '/' ;
OPEN    : '(' ;
CLOSE   : ')' ;
OPEN_BL : '{' ;
CLOSE_BL: '}' ;
IS      : '=' ;
EOL     : ';' ;
NUM     : [0-9]+ ;
VARNAME     : [a-zA-Z][a-zA-Z0-9_]*;
STR     : '"' ('\\' ["\\] | ~["\\\r\n])* '"';
WS      : [\n\r \t]+ -> skip;