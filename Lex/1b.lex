%{
    
%}

%%
[aeiou][a-zA-Z]*[ \n\t]	printf("%s\n",  yytext);
[^aeiou][a-zA-Z]*[ \n\t]	;
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
