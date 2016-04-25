%{
#include<iostream>
using namespace std;
%}
%%
(0[1-9]|[12][0-9])([.-/])(02)([.-/])((19|20)[0-9][0-9])			{cout<<"Valid Date"<<endl;}
(0[1-9]|[12][0-9]|30)([.-/])(0[469]|11)([.-/])((19|20)[0-9][0-9])	{cout<<"Valid Date"<<endl;}
(0[1-9]|[12][0-9]|31)([.-/])(0[13578]|1[02])([.-/])((19|20)[0-9][0-9])	{cout<<"Valid Date"<<endl;}
.+ {cout<<"Invalid Date"<<endl;}
%%
int main(){
	cout<<"Enter Date in format dd/mm/yyyy"<<endl;
	yylex();
	return 0;
}
