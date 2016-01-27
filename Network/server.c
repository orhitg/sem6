#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>

int main(int args, char* argv[]) {
	int server_desc, client_desc , read_size = 0;
	struct sockaddr_in server , client;
	char msg_client[2000];
	
	server_desc = socket(AF_INET,SOCK_STREAM,0);
	if(server_desc == -1) {
		puts("socket can not be created\n");
		return -1;
	}
	
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;
	server.sin_port = htons(9000);
	
	if(bind(server_desc , (struct sockaddr*) & server, sizeof(server))<0) {
		puts("bind failed\n");
		return -1;
	}
	puts("binddone!!");
	
	listen(server_desc,4);
	puts("waiting for incoming connection....");
	
	int c = sizeof(struct sockaddr_in);
	client_desc = accept(server_desc , (struct sockaddr *)&client , (socklen_t *)&c);
	if(client_desc< 0) {
		puts("unable to connect\n");
		return -1;
	}
	puts("connection accepted\n");
	read_size = 1;
	while(read_size>0) {
		char msg[2000];
		read_size = recv(client_desc , msg , 2000 , 0);
		write(client_desc , msg , strlen(msg));
		fflush(stdout);
	}
	if(read_size == 0){
		puts("client disconnected\n");
		fflush(stdout);
	}
	else if(read_size == 1)
		puts("receive failed");
	return 0;
}
