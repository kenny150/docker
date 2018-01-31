FROM ruby:2.5.0
RUN mkdir -p /autoseg/var/www && \
    mkdir -p /home/deployer/.ssh/ && \
    useradd deployer
RUN TAG=$(curl -L http://10.255.18.115/docker | grep .tar | awk -F 'href=' '{print $2}' | cut -d '>' -f1 | sed 's/\"//g' | sort -V | tail -n1) && \
    wget  http://10.255.18.115/docker/$TAG -P /autoseg/var/www && /bin/tar -xvf /autoseg/var/www/$TAG -C /autoseg/var/www && echo "TAG=$TAG" >> \
    .env
ADD . /autoseg/var/www/sso
WORKDIR /autoseg/var/www/sso
RUN ./bin/setup
RUN chown -R deployer:deployer /autoseg/
USER deployer
VOLUME /autoseg/var/www/sso/public
