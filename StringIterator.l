%{
#include<iostream>
#include<string.h>
using namespace std;
%}
%%
[a-zA-Z0-9]+ {if(yyleng > 0){
			cout<<endl;
	   		for(int i = 0; i < yyleng; i++){
	   			for(int j =0; j < yyleng - i; j++)
	   				cout<<yytext[j];
	   	  		cout<<endl;
	   	  }//for
	   	  }//if
	   	  ;}
%%
int main(){
	yylex();
	return 0;
}
