%{
    int count=1;
%}

%%
[aeiou]	printf("\n%s\t%d", yytext, count++);
.	;
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
