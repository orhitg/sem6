%{
#include<iostream>
#include<stdio.h>
using namespace std;
int iCount = 0;
%}
%%
[a-zA-Z_]+[a-zA-Z0-9_]*	{cout<<yytext<<endl;iCount++;}
.						;
\n						;
%%

int main(){

	char filename[100];
	cout<<"\nEnter file name :\t";
	cin>>filename;
	
	FILE *file = fopen(filename,"r");
	
	if(file == NULL){
		cerr<<"\nFile Name NULL"<<endl;
	}
	else{
		yyin = file;
		
		yylex();
		cout<<"\nIdentifier Count :\t"<<iCount<<endl;
		close(fileno(file));
	}
	
	return 0;
}
