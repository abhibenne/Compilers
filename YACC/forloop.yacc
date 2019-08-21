%{
	#include<stdio.h>
%}
%token ID NUMBER FOR GT LT GE LE E NE OP CP OB CB SC AND OR NOT INCR DECR ADD SUB MUL DIV EQ
%%
for:	FOR OP init SC conditions SC increment CP body { printf("Valid "); } ;
body:	OB stmts CB |
	stmt SC ;
stmts: 	stmt SC stmts | 
	stmt SC |
	for ;
init:	stmt |
	;
conditions:	condition AND conditions |
		condition OR conditions |
		condition ;
condition:	factor relop factor |
		NOT factor relop factor ;
increment:	stmt |
		ID INCR |
		ID DECR |
		;
stmt: 	ID EQ expr ;
expr: 	expr ADD term |
	expr SUB term |
	term ;
term:	term MUL factor |
	term DIV factor |
	factor;
factor:	ID |
	NUMBER ;
relop: GT | LT | GE | LE | E | NE;
%%
void yyerror(const char *str) {
	printf("Error ");
}
int main() {
	yyparse();
	return 0;
}
