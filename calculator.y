%{
#include<iostream>
using namespace std;

int yylex();
int yyerror(char const* err){
	cerr<<err;
	//exit(0);
	return 0;
}

%}

%token NUM NAME
%left '='
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

statement : expr {cout<<"\nResult:\t"<<$1<<endl;}; 

expr: expr '+' expr { $$ = $1 + $3;}
	| expr '-' expr { $$ = $1 - $3;}
	| expr '/' expr { if($3 == 0) yyerror("Division by zero"); $$ = $1 / $3;}
	| expr '*' expr { $$ = $1 * $3;}
	| '-' expr %prec UMINUS{ $$ = -$2;}
	| NUM 			{ $$ = $1;};

%%
int main(){
	cout<<"\nEnter Expr\n";
	yyparse();
	return 0;
}//main
