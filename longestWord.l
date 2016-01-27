%{
//calculate number of words, character and line
#include<string.h>
int l=0;
char longest[50];
%}
%%
[a-zA-Z]+ {if(yyleng>l){
	   l=yyleng;
	   strcpy(longest,yytext);}}
%%
int main(){
	yylex();
	printf("Longest word is %s \n",longest);
	return 0;
}
