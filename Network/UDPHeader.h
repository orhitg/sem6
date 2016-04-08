#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<iostream>
#include<netinet/in.h>
#define MAXLINE 100

using namespace std;

void dgEcho(int sockfd, sockaddr *cliaddr){
	int n;
	socklen_t len;
	char mesg[MAXLINE];
	
	cout<<"In dgEcho"<<endl;
	while(true){
		cout<<"in for loop"<<endl;
		
		len = sizeof(cliaddr);
		n = recvfrom(sockfd, mesg, MAXLINE, 0, (sockaddr*)&cliaddr, &len);
		
		cout<<"recieved"<<endl;
		sendto(sockfd, mesg, n, 0, (sockaddr*)&cliaddr, len);
		cout<<"sent"<<endl;
	}
}

void dgClient(int server_desc, const sockaddr *server, socklen_t servlen){
	int n, msglen;
	char sendline[MAXLINE], recvline[MAXLINE+1];
	
	cout<<"In dgClient"<<endl;
	while(true){
		msglen = read(fileno(stdin),sendline, MAXLINE);
		sendto(server_desc, sendline, msglen, 0, server, servlen);
		cout<<"sent"<<endl;
		
		n = recvfrom(server_desc, recvline, MAXLINE, 0, NULL, NULL);
		cout<<"recieved"<<endl;
		
		recvline[n] = 0;
		write(fileno(stdout), recvline, n);
	}
}
