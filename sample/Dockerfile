FROM ubuntu:16.04
MAINTAINER Kennedy Alves "alvkennedy@gmail.com"
LABEL description="Site estatico somente para fins de teste" version="1.0"
ENV REFRESHED_AT 2018-02-17
RUN apt-get -yqq update; apt-get -yqq install nginx
RUN mkdir -p /var/www/html/website
ADD global.conf /etc/nginx/conf.d/
ADD nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
