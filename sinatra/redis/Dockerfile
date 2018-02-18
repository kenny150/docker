FROM ubuntu:16.04
MAINTAINER Kennedy Alves "alvkennedy@gmail.com"
LABEL description "Aplicação de teste Redis com banco" version="1.0"
ENV REFRESHED_AT 2018-02-17
RUN apt-get -yqq update; apt-get -yqq install redis-server redis-tools
EXPOSE 6379
ENTRYPOINT ["/usr/bin/redis-server"]
CMD []
