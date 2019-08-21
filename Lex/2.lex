%{
#include<string.h>
    int state=0;
    char printit[100][100];
    int counts[100];
    int count=0;
    int count1=0;

%}
	
%%
"scanf"	{state =2; fprintf(yyout,"cin");}     
"printf" {state = 1;}
"(\"" {if(state == 1) {state = 2;} }
[a-zA-Z0-9,.()] {if(state == 2) {strcpy(printit[count],yyout); count++; }}
"%d"|"%s"|"%c" {if(state == 2) {counts[count1]=count; count1++; }}
"\"" {if(state == 2) {state = 3; count1=0;} }
, ;
[a-zA-Z0-9] {if(state == 3) {strcpy(printit[counts[count1]],yyout); count1++; }}
")" {fprintf(yyout, "cout"); for(int i=0;i<count;i++) {fprintf(yyout,printit[i]);} count=0;}
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
