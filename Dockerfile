FROM ruby:2.5.0
RUN mkdir -p /autoseg/var/www
RUN useradd deployer
RUN mkdir -p /home/deployer
ADD . /autoseg/var/www/sso
WORKDIR /autoseg/var/www/sso
#RUN ./bin/setup
RUN chown -R deployer:deployer /autoseg/
USER deployer
VOLUME /autoseg/var/www/sso/public
#STOPSIGNAL ex; SIGKILL,SIGNAME,9,15,etc ... //Defini como parar o container quando houver um sinal de stop
#HELTHCHECK //Define instruções de como validar se o container ainda está em execução.
#ONBUILD ADD . /app/html //Com isso quando eu usar essa imagem como uma imagem base (ex; FROM estaimagem) o comando ADD . /app/html irá por padrão no momento do outro build
