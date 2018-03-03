FROM ubuntu:16.04
MAINTAINER Kennedy Alves
ENV REFRESHED_AT 2018-03-02

RUN apt-get -yqq update
RUN apt-get -yqq install wget

VOLUME ["/var/lib/tomcat7/webapps/"]
WORKDIR /var/lib/tomcat7/webapps/

ENTRYPOINT ["wget"]
CMD ["-?"]
