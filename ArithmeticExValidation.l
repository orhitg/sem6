%{
#include<iostream>
#include<stdio.h>
using namespace std;
%}
%%
[0-9]+[-+*/][0-9]+					{cout<<"Valid Arithmetic expression"<<"\n\n";}
[Qq]									{exit(0);}
.+									{cout<<"Invalid Arithmetic expression"<<"\n\n";}
\n									;
%%

int main(){
	cout<<"\nEnter Expression(Q for Quit) :\n\n";
		
	yylex();
	
	return 0;
}
