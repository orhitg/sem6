%{
#include<iostream>
using namespace std;

int yylex();
int yyerror(char const* err){
	cerr<<err<<endl;
	return 0;
}

%}
%token A

%%

statement : expr '\n'	{cout<<"Pattern Matched\n\n";}; 

expr: A 'b';
  
%%
int main(){
	cout<<"\nEnter Expr\n";
	yyparse();
	
	return 0;
}//main
