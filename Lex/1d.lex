%{
    int count=1;
%}

%%
[a-zA-Z]*[aeiou][a-zA-Z]*[aeiou][a-zA-Z]*[ \t\n]	printf("\n%s\t%d", yytext, count++);
[a-zA-Z]*[ \t\n]	;
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
