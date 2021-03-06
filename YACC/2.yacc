%{
	#include<stdio.h>
%}

%token NUMBER ID FOR AND OR NOT LT GT LE GE EQ NE ADD SUB EQU MUL DIV SC OB CB OP CP INCR DECR

%%

for:	FOR OP init SC cond SC inc CP body { printf("valid"); };
body:	OB stmts CB |
	stmt SC ;
stmts:	stmt SC stmts |
	stmt SC |
	for ;
init:	stmt |
	;
cond:	c AND cond |
	c OR cond |
	c ;
c:	f relop f |
	NOT f relop f ;
inc:	ID INCR |
	ID DECR |
	stmt |
	;
stmt:	ID EQU expr;
expr:	expr ADD term |
	expr SUB term |
	term;
term:	term MUL f |
	term DIV f |
	f;
f:	ID | 
	NUMBER;
relop:	LT | GT | LE | GE | EQ | NE;
		  	

%%

#include"lex.yy.c"

void yyerror(const char *str) {
	printf("Error ");
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yyparse();
    fclose(yyin);
}

