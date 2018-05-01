#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <iostream>
#include <thread>
#include "servertcp.h"
#include "server.h"

using namespace std;


void processa();



int main()
{
    int port = 1444;
    cout << "Inicializando" << endl;
    //thread t1(processa);
    ServerTCP scp(port);
    //server s;
    //cout<<"Criado!";



    //return 0;
}

void processa(){    

    puts("Aguardando comandos...");
while(1){
    sleep(1000);
}

}
