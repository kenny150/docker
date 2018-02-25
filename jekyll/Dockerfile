FROM ubuntu:16.04
MAINTAINER Kennedy Alves <alvkennedy@gmail.com>
ENV REFRESHED_AT 2018-02-24

RUN apt-get -ypp update
RUN apt-get -yqq install ruby ruby-dev build-essential nodejs
RUN gem install jekyll -v 2.5.3

VOLUME /data
VOLUME /var/www/html
WORKDIR /data

ENTRYPOINT ["jekyll", "build", "--destination=/var/www/html" ]
