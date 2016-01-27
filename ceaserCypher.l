%{
//ceaser cypher
#include<iostream>
using namespace std;
int temp = 0;
%}
%%
[a-wA-W]     {temp = (int)yytext[0];
	      temp+=3;
	      cout<<(char)temp;}

[x-zX-Z]     {temp = (int)yytext[0];
	      temp-=23;
	      cout<<(char)temp;}

[0-9]        {temp = atoi(yytext);
	      temp+=3;
	      cout<<temp;}

[ ]           {cout<<" ";}
%%
int main(){
	yylex();
	return 0;
}
