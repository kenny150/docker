FROM ruby:2.5.0
RUN mkdir -p /autoseg/var/www
RUN useradd deployer
RUN mkdir -p /home/deployer
ADD . /autoseg/var/www/sso
WORKDIR /autoseg/var/www/sso
RUN ./bin/setup
RUN chown -R deployer:deployer /autoseg/
USER deployer
VOLUME /autoseg/var/www/sso/public
