%{
#include <iostream>
using namespace std;
FILE *out;
int lineno;

%}

%%

.*\n fprintf(out,"%d%s",++lineno,yytext);
	


%%



int main(int argc, char *argv[]){


if(argc==3)
{

yyin=fopen(argv[1],"r");
out=fopen( argv[2],"w");
yylex();
printf("no of lines %d",lineno );
//yyin.close();
//out.close(); 

}
return 0;

}

