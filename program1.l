%{
//calculate number of characters
int count = 0;
%}
%%
[a-zA-Z0-9] {count++;}
%%

int main(){
	yylex();
	printf("No of id(s) found %d",count);
	return 0;
}
