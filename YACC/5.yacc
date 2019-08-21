%{
	#include<stdio.h>
%}

%token NUMBER ID DEFINE AND OR NOT LT GT LE GE EQ NE ADD SUB EQU MUL DIV SC C OB CB OP CP INCR DECR

%%

define:	DEFINE ID body { printf("valid"); } ;
body:	OP expr CP |
	expr;
expr:	expr ADD term |
	expr SUB term |
	term;
term:	term MUL f |
	term DIV f |
	f;
f:	ID | 
	NUMBER;  	

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

