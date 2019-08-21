%{
#include<string.h>
char print[100][100],quote[100][100];
int pc=0,qc=0;
%}

%s printBEGIN scanBEGIN vari vari2

%%
printf\(\" {
	BEGIN printBEGIN;
	}

<printBEGIN>[^%"]* {
		quote[qc][0]='\"';
		int j;
		for(j=1;j<=yyleng;j++) {
			quote[qc][j]=yytext[j-1];
		}
		quote[qc][j]='\"';
		quote[qc][j+1]='\0';
		qc++;
	}

<printBEGIN>\%[dsfc] {
		quote[qc][0]='\0';
		qc++;
	}
<printBEGIN>\"\,  {
		BEGIN vari;
		}
<printBEGIN>\"\)  {
		fwrite("cout>>",6,1,yyout);
		int k=0,j;
		for(j=0;j<qc;j++) {
			if(quote[j][0]=='\0') {
				fwrite(print[k],strlen(print[k]),1,yyout);
				k++;
			} else {
				fwrite(quote[j],strlen(quote[j]),1,yyout);
			}
			if(j!=qc-1)
				fwrite(">>",2,1,yyout);
				
		}
		BEGIN 0;
		pc=0;
		qc=0;
		}
<vari>[^,)]* {
		int j;
		for(j=0;j<yyleng;j++) {
			print[pc][j]=yytext[j];
		}
		print[pc][j+1]='\0';
		pc++;
	}
<vari>\, ;
<vari>\) {
		fwrite("cout>>",6,1,yyout);
		int k=0,j;
		for(j=0;j<qc;j++) {
			if(quote[j][0]=='\0') {
				fwrite(print[k],strlen(print[k]),1,yyout);
				k++;
			} else {
				fwrite(quote[j],strlen(quote[j]),1,yyout);
			}
			if(j!=qc-1)
				fwrite(">>",2,1,yyout);
				
		}
		BEGIN 0;
		pc=0;
		qc=0;
		}
		
scanf\(\" {
	BEGIN scanBEGIN;
	}

<scanBEGIN>\%[dsfc] ;
<scanBEGIN>\"\,  {
		BEGIN vari2;
		}
<vari2>[^,)&]* {
		int j;
		for(j=0;j<yyleng;j++) {
			print[pc][j]=yytext[j];
		}
		print[pc][j+1]='\0';
		pc++;
	}
<vari2>\, ;
<vari2>\& ;
<vari2>\) {
		fwrite("cin<<",5,1,yyout);
		int k=0,j;
		for(j=0;j<pc;j++) {
			fwrite(print[j],strlen(print[j]),1,yyout);
			if(j!=pc-1)
				fwrite("<<",2,1,yyout);
				
		}
		BEGIN 0;
		pc=0;
		qc=0;
		}		
%%

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
