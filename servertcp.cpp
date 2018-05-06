#include "servertcp.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>
#include <boost/lexical_cast.hpp>
#include <iostream>
#include <fstream>

#define BUFFER_SIZE 256



ServerTCP::ServerTCP()
{
    portNumber = 1234;
    socketfd = socket(AF_INET, SOCK_STREAM, 0); //obtém o socket do sistema
    ///AF_INET = socket que aceita endereços ipv4
    if (socketfd == -1) {
        printf("Nao foi possivel criar o socket\n");
        //return -1;
    }

    //Preparando a struct do socket
    servidor.sin_family = AF_INET;//AF_INET = socket que aceita endereços ipv4
    servidor.sin_addr.s_addr = INADDR_ANY; // Obtem IP do S.O.
    servidor.sin_port = htons(portNumber);//associa esse socket com a porta

    //Associando o socket a porta e endereco
    if (bind(socketfd, (struct sockaddr *) &servidor, sizeof (servidor)) < 0) {
        puts("Erro ao fazer bind Tente outra porta\n");
        //return -1;
    }
    puts("Bind efetuado com sucesso\n");

    // Ouvindo por conexoes
    listen(socketfd, 1); //marco esse socket como passivo, que só excuta conexões e aceita no máximo 1 conexao pendentes em sua fila
    acceptConections();
}
///------------------------------------------------------------------------------------------------------

ServerTCP::ServerTCP(int port)
{

    portNumber = port;
    socketfd = socket(AF_INET, SOCK_STREAM, 0); //obtém o socket do sistema
    ///AF_INET = socket que aceita endereços ipv4
    if (socketfd == -1) {
        printf("Nao foi possivel criar o socket\n");
        //return -1;
    }

    //Preparando a struct do socket
    servidor.sin_family = AF_INET;//AF_INET = socket que aceita endereços ipv4
    servidor.sin_addr.s_addr = INADDR_ANY; // Obtem IP do S.O.
    servidor.sin_port = htons(portNumber);//associa esse socket com a porta

    //Associando o socket a porta e endereco
    if (bind(socketfd, (struct sockaddr *) &servidor, sizeof (servidor)) < 0) {
        puts("Erro ao fazer bind Tente outra porta\n");
        //return -1;
    }
    puts("Bind efetuado com sucesso\n");

    // Ouvindo por conexoes
    listen(socketfd, 1);
    acceptConections();
}
///------------------------------------------------------------------------------------------------------

ServerTCP::~ServerTCP()
{

}
///------------------------------------------------------------------------------------------------------

void ServerTCP::acceptConections()
{
    printf("Aguardando por conexoes...");
    int c = sizeof (struct sockaddr_in);
    int conexao;


    while ((conexao = accept(socketfd, (struct sockaddr *) &cliente, (socklen_t*) & c)))
    {
        clienteIp = inet_ntoa(cliente.sin_addr);
        clientePort = ntohs(cliente.sin_port);
       // printf("cliente conectou: %s : [ %s ]\n", clienteIp, clientePort);
        if (conexao < 0)
        {
            perror("Erro ao receber conexao\n");
            return;
        }
        puts("Handler assigned\n\n");

        int tamanho = 1;
        char respostab[BUFFER_SIZE];
        while(tamanho>0)
        {
            if ((tamanho = read(conexao, respostab, BUFFER_SIZE)) < 0)
            {
                perror("Erro ao receber dados do cliente: ");

            }
            else
            {



                        usleep(10000);
                        cout<<"rbuffer: "<<respostab;
                        std::string packs_size = std::string(respostab);
                        std::string resposta_str = "";

                        unsigned long int qtd = std::stol(packs_size);
                        cout<<"QTD DE PACKS: "<<qtd<<endl;
                        bzero(respostab,BUFFER_SIZE);

                        if(qtd==1){

                            tamanho = read(conexao, respostab, BUFFER_SIZE);
                            if(tamanho <= 0) {
                                 printf("ClientTCP::sendMessageToServer = Erro ao ler no socket");
                                 close(conexao);
                                 //connected = false;
                                 //return -1;
                                }

                        cout<<"RESPOSTAB: "<<respostab<<endl;

                        if(respostab[0]=='0') {
                            //exec emergencia() - telegram bot etc, retorna acesso como válido
                            std::string resp;
                            resp.push_back('2');
                            cout<<"RESP:: "<<resp<<endl;
                            fragment(resp,conexao);
                        }

                        else if(respostab[0]=='1'){
                            // exec valid_senha() - procura a senha fornecida no banco de dados mysql retorna 0 para nao valido e 1 para valido

                            std::string resp;
                           resp.push_back(pwd_validation(respostab));
                           fragment(resp,conexao);

                        }


                        else if(respostab[0]=='2') {

                            // exec wgt_valid() -- compara o peso (com a tolerancia e retorna 0 ou 1

                            std::string resp;
                            resp.push_back(wgt_validation(respostab));
                            fragment(resp,conexao);
                        }

                        else if(respostab[0]=='3'){
                            // exec finger_valid() -> busca a digital no banco de dados através da senha previamente digitada
                            cout<<"INICIANDO FRAGMENTADOR"<<endl;
                            cout<<A_FING<<endl;
                            fragment(A_FING,conexao);


                        }
                        else if(respostab[0]=='5'){
                            // exec new_user()
                        }

                        else return;
                        }
              else if(qtd>20)
                        {
                           resposta_str = "";
                           for(int bytes=0;bytes<qtd;bytes++){
                              tamanho = read(conexao, respostab, 1);
                              if(tamanho <= 0) {
                                   printf("ClientTCP::sendMessageToServer = Erro ao ler no socket");
                                   close(conexao);
                                   //connected = false;
                                   return;
                                  }
                              resposta_str.push_back(respostab[0]);
                              //usleep(1000);

                           }
                           cout<<"IMAGEM RECEBIDA"<<endl;
                           std::string img_str = resposta_str;
                           std::ofstream img_file;
                           img_file.open("wallpaper_rcvd.jpg", std::ios_base::out | std::ios_base::binary);
                           img_file.write(img_str.c_str(), img_str.length());
                           img_file.close();
                           fragment("1",conexao);
                        }
                else{
                            resposta_str = "";
                    for(int packs=0;packs<qtd;packs++){

                        tamanho = read(conexao, respostab, BUFFER_SIZE);
                        if(tamanho <= 0) {
                             printf("ClientTCP::sendMessageToServer = Erro ao ler no socket");
                             close(conexao);
                             //connected = false;
                             return;
                            }

                        for(int i=0;i<BUFFER_SIZE;i++){
                        if(respostab[i]!=NULL){
                        resposta_str.push_back(respostab[i]);

                        usleep(2000);
                        }

                        else break;
                        }
                        bzero(respostab,BUFFER_SIZE);
                       // cout<<"Fragmento: "<<resposta_str<<endl;

                    }


                        }
                /*for(int i = 0; i< tamanho;i++)
                {
                    printf("tamanho: %d\n", tamanho);///teste
                    printf("resposta[i]: %c\n", respostab[i]);///teste



                }*/
            /*
            cout<<tamanho<<endl;
            unsigned char resposta[tamanho];
            for(int k=0;k<tamanho;k++)
                resposta[k]=respostab[k];



            if(resposta[0]=='0'){
                //exec emergencia() - telegram bot etc, retorna acesso como válido
                std::string resp;
                resp.push_back('2');
                cout<<"RESP:: "<<resp<<endl;
                fragment(resp,conexao);
            }
            else if(resposta[0]=='1'){
                // exec valid_senha() - procura a senha fornecida no banco de dados mysql retorna 0 para nao valido e 1 para valido

                std::string resp;
                resp.push_back(pwd_validation(resposta));
                fragment(resp,conexao);

            }                         
            else if(resposta[0]=='2'){
                // exec wgt_valid() -- compara o peso (com a tolerancia e retorna 0 ou 1
                
                std::string resp;
                resp.push_back(wgt_validation(resposta));
                fragment(resp,conexao);
                //resp = new char[128];
                //resp[1] = wgt_validation(resposta);

                //int o = write(conexao,resp,sizeof(resp)+1);
                //if(o < 0) exit(1);
            }

            else if(resposta[0]=='3'){
                // exec finger_valid() -> busca a digital no banco de dados através da senha previamente digitada
                cout<<"INICIANDO FRAGMENTADOR"<<endl;
                cout<<A_FING<<endl;
                fragment(A_FING,conexao);
                


            }
            else if(resposta[0]=='4'){
                // exec face_valid()
            }

            else if(resposta[0]=='5'){
                // exec novo usuario


            }



                cout<<"Resposta Enviada"<<endl;
                ///teste
                //resposta[tamanho] = '\0';
                //printf("O cliente falou: %s\n", resposta);
            */
            }

            /*if (strcmp(resposta, "end") == 0) {
                close(conexao);
                printf("Servidor finalizado...\n");
                return;
            }*/
            cout<<"Resposta enviada!"<<endl;
            bzero(respostab,BUFFER_SIZE);
        }

    }
}


char ServerTCP::pwd_validation(char *resposta){
    cout<<"TAMANHO DA VAR : "<<sizeof(resposta)<<endl;
    cout<<resposta<<endl;


    std::string PWD;
    for(int i=1;i<5;i++){
       PWD.append(1,resposta[i]);
    }

    
    int IPWD = boost::lexical_cast<int>(PWD); 
    
    
    
    driver = get_driver_instance();
    try{
        con = driver->connect(A_IP, A_USER, A_PSWD);
        con->setSchema(A_SCHEMA);
        printf("Conexão estabelecida com o servidor\n");
        printf("Pronto para o envio de mensagens\n");

    }

    catch(sql::SQLException &e){
    cout << "# ERR: SQLException in " << __FILE__;
        cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
        cout << "# ERR: " << e.what();
        cout << " (MySQL error code: " << e.getErrorCode();
        cout << ", SQLState: " << e.getSQLState() << " )" << endl;

        }
    
    std::auto_ptr< sql::Connection > con(driver->connect(A_IP, A_USER, A_PSWD));
        con->setSchema(A_SCHEMA);
        std::auto_ptr< sql::Statement > stmt(con->createStatement());
        std::auto_ptr< sql::PreparedStatement >  pstmt;
        std::auto_ptr< sql::ResultSet > res;
        pstmt.reset(con->prepareStatement("CALL safep_rt(?,@cadastro,@fing,@wht)"));
        pstmt->setInt(1,IPWD);
        pstmt->execute();
        pstmt.reset(con->prepareStatement("SELECT @cadastro AS A_CPF"));
            res.reset(pstmt->executeQuery());
            while (res->next()) {
                A_CPF = res->getUInt64("A_CPF");
            }

            pstmt.reset(con->prepareStatement("SELECT @fing AS A_FING"));
                res.reset(pstmt->executeQuery());
                while (res->next()) {
                    A_FING = res->getString("A_FING");
                }
                pstmt.reset(con->prepareStatement("SELECT @wht AS A_WEIGHT"));
                    res.reset(pstmt->executeQuery());
                    while (res->next()) {
                        A_WEIGHT = res->getInt("A_WEIGHT");
                    }
            cout<<A_CPF<<endl;
            cout<<A_FING<<endl;
            cout<<A_WEIGHT<<endl;

            if(A_CPF!=0) return '1';
            else return '0';

        }

char ServerTCP::wgt_validation(char* resposta){
    std::string WGT;
    int len = sizeof(resposta);
    cout<<len<<endl;
    for(int i=1;i<sizeof(resposta);i++)
    WGT.append(1,resposta[i]);

    cout<<"STRING-> :"<<WGT<<endl;
    int weight = atoi(WGT.c_str());
    cout<<weight<<endl;
    cout<<"PESO RECEBIDO: "<<weight<<endl;
    cout<<"PESO BD: "<<A_WEIGHT<<endl;
    float tol = 0.05*A_WEIGHT;
    cout<<"TOLERANCIA: "<<tol<<endl;
    if(weight>=(A_WEIGHT-tol)&&weight<=(A_WEIGHT+tol)) return '1';

    else return '0';
}

char ServerTCP::fng_validation(char* resposta){

}

char ServerTCP::fac_validation(char* resposta){

}

char ServerTCP::new_usr(char* resposta){
/*

    driver = get_driver_instance();
    try{
        con = driver->connect(A_IP, A_USER, A_PSWD);
        con->setSchema(A_SCHEMA);
        printf("Conexão estabelecida com o servidor\n");
        printf("Pronto para o envio de mensagens\n");

    }

    catch(sql::SQLException &e){
    cout << "# ERR: SQLException in " << __FILE__;
        cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
        cout << "# ERR: " << e.what();
        cout << " (MySQL error code: " << e.getErrorCode();
        cout << ", SQLState: " << e.getSQLState() << " )" << endl;

        }

    std::auto_ptr< sql::Connection > con(driver->connect(A_IP, A_USER, A_PSWD));
        con->setSchema(A_SCHEMA);
        std::auto_ptr< sql::Statement > stmt(con->createStatement());
        std::auto_ptr< sql::PreparedStatement >  pstmt;
        std::auto_ptr< sql::ResultSet > res;
        pstmt.reset(con->prepareStatement("CALL safep_new(?,?,?)"));
        pstmt->setInt(1,NPWD);
        pstmt->setUInt64(2,NCPF);
        pstmt->setString(3,NF1);
        pstmt->setString(4,NF2);
        pstmt->setString(5,NF3);
        pstmt->setString(6,NWGT);
        pstmt->execute();
        pstmt.reset(con->prepareStatement("SELECT @cadastro AS A_CPF"));
            res.reset(pstmt->executeQuery());
            while (res->next()) {
                A_CPF = res->getUInt64("A_CPF");
            }

            pstmt.reset(con->prepareStatement("SELECT @fing AS A_FING"));
                res.reset(pstmt->executeQuery());
                while (res->next()) {
                    A_FING = res->getString("A_FING");
                }
                pstmt.reset(con->prepareStatement("SELECT @wht AS A_WEIGHT"));
                    res.reset(pstmt->executeQuery());
                    while (res->next()) {
                        A_WEIGHT = res->getInt("A_WEIGHT");
                    }
*/
}

void ServerTCP::fragment(std::string full_str,int conexao){


    unsigned long int len = full_str.size();//full_str.length();
    cout<<len<<endl;
    unsigned long int m=10;
    unsigned long int i=1;
    int j=1;
    while(true){
    m = len/i;
    cout<<m<<endl;
    if(m<BUFFER_SIZE) break;
    i++;
    }
    unsigned long int packs;
    if(len%BUFFER_SIZE==0){
    packs = i-1;
    }
    else{
    packs = i;
    }
    cout<<packs<<endl;
    char * resp = new char[BUFFER_SIZE];
    bzero(resp,BUFFER_SIZE);
    i =0;
    j=0;
    char * fstr = new char[full_str.length()];
    //bzero(fstr,full_str.size());
    strcpy (fstr, full_str.c_str());
    cout<<"FSTR: "<<fstr<<endl;
    //cout<<"FSTR SIZE: "<<fstr<<endl;
    std::string s = std::to_string(packs);
    char const *pchar = s.c_str();
    memcpy (resp,pchar,BUFFER_SIZE);

    cout<<"Primeiro envio: "<<resp<<endl;
    int p=write(conexao,resp,std::string(pchar).size());
    if(p<0) exit(1);
    usleep(10000);
    for(int n=0;n<packs;n++)
    {
        resp = new char[BUFFER_SIZE];
        int aux = i;
        for (i=aux; i<aux+BUFFER_SIZE;i++){
            if(fstr[i]!=NULL){
            resp[j]=fstr[i];
            j++;
            }
            else{
                 break;

            }
        }


        char send[j];
        for(int h=0;h<j;h++)
        send[h]=resp[h];

        cout<<"Enviando isto: "<<send<<endl;
        cout<<"TAMANHO: "<<sizeof(send)<<endl;
        int p=write(conexao,send,sizeof(send)); //sizeof(resp)+1
        if (p < 0) break;
        usleep(15000);
        j=0;
        delete [] resp;
       // bzero(resp,BUFFER_SIZE);
    }


}


///------------------------------------------------------------------------------------------------------

//thread ServerTCP::getServerThread()
//{
//  return thread([=] { acceptConections(); });
//}
///------------------------------------------------------------------------------------------------------
