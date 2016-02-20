%{
#include<iostream>
#include"y.tab.h"
using namespace std;

%}

%%
[a]    {return yytext[0];}
[b]	   {return yytext[0];}
\n	   {return 0;}
