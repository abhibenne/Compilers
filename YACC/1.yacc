%{
	#include<stdio.h>
	void push(int val);
%}

%token NUMBER

%%

S: E { printf("Output: %d",top()); };
E:	E E '+' { push(pop() + pop()); } |
	E E '-' { push(pop() - pop()); } |
	E E '*' { push(pop() * pop()); } |
	E E '/' { push(pop() / pop()); } |
	NUMBER { push(yylval); };	

%%

#include"lex.yy.c"
int stack[100];
int i=0;

void push(int val) {
	stack[i] = val;
	i++;
}

int pop() {
	i--;
	return stack[i];
}

int top() {
	return stack[i-1];
} 

int main() {
	printf("Enter postfix expression");
	yyparse();
	return 0;
}
