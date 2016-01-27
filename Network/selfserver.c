#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>

int main(int args,char* argv[]){
	int server_desc, client_desc, read_size = 0;
	sockaddr_in server, client;
	char client_msg[200];
	
	server = socket(AF_INET,SOCK_STREAM,0);
	if(server == -1){
		puts("Socket cannot be created");
		return -1;
	}
	
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY
	server.sin_port = htons(9000);
	
	if(bind(server , 
}//main
