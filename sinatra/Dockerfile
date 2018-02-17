FROM ubuntu:16.04
MAINTAINER Kennedy Alves "alvkennedy@gmail.com"
LABEL description="Aplicação sinatra para fins de teste" version="1.0"
ENV REFRESHED_AT 2018-02-17
RUN apt-get -yqq update; apt-get -yqq install ruby ruby-dev build-essential redis-tools
RUN gem install --no-doc --no-ri sinatra json redis
RUN mkdir -p /opt/webapp
EXPOSE 4567
CMD [ "/opt/webapp/bin/webapp" ]
