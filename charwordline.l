%{
//calculate number of words, character and line
int nChar,nWord,nLine;
%}
%%
\n        {nLine++,nChar++;}
[^ \t\n]+ {nWord++;nChar+=yyleng;}
.         {nChar++;}
%%

int main(){
	yylex();
	printf("No of char %d word %d and line %d found\n",nChar,nWord,nLine);
	return 0;
}
