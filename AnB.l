%{
#include<iostream>
#include"y.tab.h"
using namespace std;

%}
%option noyywrap

%%
[a]    {return yytext[0];}
[b]	   {return yytext[0];}
\n	   {return 0;}
