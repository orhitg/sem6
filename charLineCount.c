%{
//calculate number of characters
int count = 0;
int line = 0;
%}
%%
[a-zA-Z0-9] {count++;}
\n 			{line++;}
%%

int main(){
	yylex();
	printf("No of id(s) found : %d and line : %d",count, line);
	return 0;
}
