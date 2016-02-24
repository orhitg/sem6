%{
#include<iostream>
using namespace std;
int count = 0;
int yylex();
int yyerror(char const* err){
	cerr<<err<<endl;
	return 0;
}

%}



%%

statement : expr '\n'	{if(count >= 10)
							cout<<"Pattern Matched"<<endl;
							else
								yyerror("Pattern not matched");}; 

expr: A 'b';

A : 'a' A				{count++;}
  | 'a' 				{count++;};
  
%%
int main(){
	cout<<"\nEnter Expr\n";
	yyparse();
	
	return 0;
}//main
