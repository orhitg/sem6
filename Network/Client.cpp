#include<iostream>
#include<stdio.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<unistd.h>

#define MAXLINE 256
using namespace std;

int main(){

	int client_desc = socket(AF_INET, SOCK_STREAM , 0);
	
	struct sockaddr_in server_addr;
	server_addr.sin_family = AF_INET;
	server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
	server_addr.sin_port = htons(9000);

	int result = connect(client_desc,(sockaddr*)&server_addr, sizeof(server_addr));
	
	char buff[MAXLINE];
	int readl;
	
	cout<<"\n\nEnter Anything  \n";
	while((readl = read(fileno(stdin), buff, MAXLINE)) > 0){
		write(client_desc, buff, readl);
		
		readl = read(client_desc, buff, MAXLINE);
		write(fileno(stdout), buff, readl);
	}//while
}//main
