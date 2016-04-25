%{
#include<iostream>
#include<fstream>
#include<string.h>
#include<stdio.h>
using namespace std;
int line = 0;
FILE *out;
%}
%%
.*\n {fprintf(out,"%d %s",++line, yytext);}
%%
int main(){
	string filename;
	cout<<"Enter File name\n";
	cin>>filename;
	
	yyin = fopen(filename.c_str(),"r");
	out = fopen("temp.cpp","w");
	
	yylex();
	
	remove(filename.c_str());
	rename("temp.cpp",filename.c_str());
	
	return 0;
}
