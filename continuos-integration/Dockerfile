FROM jenkins
MAINTAINER kennedy Alves "alvkennedy@gmail.com"
ENV REFRESHED_AT 2018-02-18

USER root
RUN apt-get update -yqq ; apt-get install -yqq sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "Sucesso !!"
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
RUN tar -zxvf docker-latest.tgz
RUN mv docker/* /usr/bin/

USER jenkins
RUN /usr/local/bin/install-plugins.sh junit git git-client ssh-slaves greenballs chucknorris ws-cleanup
