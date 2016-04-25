%{
#include<iostream>
#include"y.tab.h"
using namespace std;

%}
%option noyywrap

%%
[a]{10,}     {return A;}
[b]	   {return yytext[0];}
\n	   {return yytext[0];}
