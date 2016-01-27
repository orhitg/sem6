%{
//calculate number of words, character and line
int k;
%}
%%
-?[0-9]+ {k = atoi(yytext);
	if(k%7==0){ k+=3;}
	printf("Incremented number is %d \n",k);}
-?[0-9.]+ ECHO;
%%

int main(){
	yylex();
	return 0;
}
