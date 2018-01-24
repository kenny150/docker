# DOCKER 

Executando aplicações Ruby usando container.

# COMO FUNCIONA ?

O Docker compose inicia dois containers, um deles é de uma imagem com Ruby 2.3 (que é onde roda minha aplicação). O segundo container roda um apache, utilizo ele para servidor a minha aplicação. Os meus containers buscam a aplicação em um repositório (seja local ou não, mas neste caso é local), pega essa aplicação, aloca em um diretório e segue a receita do Docker file e docker-compose.

# DEPENDENCIAS

O Apache quando sobe, ele busca uma chave para rodar em SSL, então basta colocar as suas chaves dentro de /etc/pki/CA/certs/ , desta forma o apache se iniciará sem nenhum problema.
Também é necessário informar onde buscar a aplicação.

# SETUP

1º - Faça o clone do projeto 
2º - docker-compose build app
3º - docker-compose build apache
// Se tudo ocorrer bem
4º - docker-compose up

\_('_')_/






