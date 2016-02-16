%{
#include<iostream>
using namespace std;
int match_count = 0;
int yylex();
int yyerror(char const* err){
	//cerr<<err<<endl;
	match_count = -1;
	return 0;
}

%}

%%

statement : expr {match_count++;}; 

expr: 'a' expr 'b'	
	| 'a' 'b';

%%
int main(){
	cout<<"\nEnter Expr\n";
	yyparse();
	
	if(match_count == 1)
		cout<<"Pattern Matched"<<endl;
	else
		cout<<"Syntax error"<<endl;
	
	return 0;
}//main
