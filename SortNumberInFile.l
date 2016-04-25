%{
#include<iostream>
#include<fstream>
#include<string.h>

using namespace std;

void sort();
int num[100];
int in = 0;
%}
%%
[0-9]+ {num[in++] = atoi(yytext);}
.     ;
\n    ;

%%
int main(){
	string filename;
	cout<<"Enter file name\n";
	cin>>filename;
	
	yyin = fopen(filename.c_str(),"r");
	
	yylex();
	sort();
	return 0;
}

void sort(){
	int key, temp,j;
	for(int i = 1; i < in; i++){
		key = num[i];
		for(j = i-1 ;j >= 0 && num[j] > key; j--){
			num[j+1] = num[j];
		}//for
		num [j+1] = key;
	}//for
	
	cout<<"Sorted Numbers\n";
	for(int i = 0; i < in; i++){
		cout<<num[i]<<endl;
	}
	
	cout<<endl;
}
