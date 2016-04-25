1 #include<stdio.h>
2 #include<string.h>
3 #include<unistd.h>
4 #include<sys/socket.h>
5 #include<arpa/inet.h>
6 
7 int main(int args, char* argv[]) {
8 	int server_desc, client_desc , read_size = 0;
9 	struct sockaddr_in server , client;
10 	char msg_client[2000];
11 	
12 	server_desc = socket(AF_INET,SOCK_STREAM,0);
13 	if(server_desc == -1) {
14 		puts("socket can not be created\n");
15 		return -1;
16 	}
17 	
18 	server.sin_family = AF_INET;
19 	server.sin_addr.s_addr = INADDR_ANY;
20 	server.sin_port = htons(9000);
21 	
22 	if(bind(server_desc , (struct sockaddr*) & server, sizeof(server))<0) {
23 		puts("bind failed\n");
24 		return -1;
25 	}
26 	puts("binddone!!");
27 	
28 	listen(server_desc,4);
29 	puts("waiting for incoming connection....");
30 	
31 	int c = sizeof(struct sockaddr_in);
32 	client_desc = accept(server_desc , (struct sockaddr *)&client , (socklen_t *)&c);
33 	if(client_desc< 0) {
34 		puts("unable to connect\n");
35 		return -1;
36 	}
37 	puts("connection accepted\n");
38 	read_size = 1;
39 	while(read_size>0) {
40 		char msg[2000];
41 		read_size = recv(client_desc , msg , 2000 , 0);
42 		write(client_desc , msg , strlen(msg));
43 		fflush(stdout);
44 	}
45 	if(read_size == 0){
46 		puts("client disconnected\n");
47 		fflush(stdout);
48 	}
49 	else if(read_size == 1)
50 		puts("receive failed");
51 	return 0;
52 }
