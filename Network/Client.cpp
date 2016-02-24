#include<iostream>
#include<sys/socket.h>
#include<netinet/in.h>
#include<unistd.h>

using namespace std;

int main(){

	int c = 0;
	int client_desc = socket(AF_INET, SOCK_STREAM , 0);
	
	struct sockaddr_in server_addr;
	server_addr.sin_family = AF_INET;
	server_addr.sin_addr.s_addr = inet_addr(127.0.0.1);
	server_addr.sin_port = htons(9000);

	int conn = connect(client_desc,(sockaddr*)&server_addr, sizeof(server_addr));
	
}//main
