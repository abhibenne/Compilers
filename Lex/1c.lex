%{
    int count=1;
%}

%%
[a-zA-Z]*[pt][a-zA-Z]*	printf("\n%s\t%d", yytext, count++);
[^pt]*[ \t\n]	;
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
