%{
	#include<stdio.h>
%}

%token NUMBER ID SWITCH CASE DEFAULT BREAK AND OR NOT LT GT LE GE EQ NE ADD SUB EQU MUL DIV SC C OB CB OP CP INCR DECR

%%

switch:	SWITCH OP expr CP body { printf("valid"); } ;
body:	OB cases CB ;
cases:	CASE expr C stmts BREAK SC cases |
	CASE expr C stmts BREAK SC |
	DEFAULT C stmts BREAK SC;
stmts:	stmt SC stmts |
	stmt SC |
	switch ;
stmt:	ID EQU expr;
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

