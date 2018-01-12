FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs wget build-essential gcc openssl git
RUN mkdir -p /autoseg/var/www && \
    mkdir -p /home/deployer/.ssh/ && \ 
    useradd deployer && \
    echo "export RAILS_MASTER_KEY=7a2e2fed7c641f2e43e9afc365b78ab1" >> /etc/profile.d/passmonki-key.sh && \
    chmod o+x /etc/profile.d/passmonki-key.sh && \
    chown -R deployer:deployer /home/deployer/
RUN wget  http://10.255.18.115/docker/sso.tar -P /autoseg/var/www && /bin/tar -xvf /autoseg/var/www/sso.tar -C \
    /autoseg/var/www
RUN chown -R deployer:deployer /autoseg/
ADD . /autoseg/var/www/sso
WORKDIR /autoseg/var/www/sso
RUN ./bin/setup
VOLUME /autoseg/var/www/sso/public
