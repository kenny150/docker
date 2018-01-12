FROM centos:7
# Mantenedor da receita
MAINTAINER Equipe AutoSeg <kennedy.santos@autoseg.com>
LABEL Passmonki Server
RUN /bin/rm -f /etc/yum.repos.d/*.repo && touch /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo "#Pacotes básicos" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "[Autoseg-base]" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "name=CentOS- - AutosegBase" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "baseurl=http://10.255.18.115/repos" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "gpgcheck=0" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "enabled=1" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  " " >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "#Atualizações" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "[Autoseg-updates]" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "name=CentOS- - AutosegUpdate"s >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "baseurl=http://10.255.18.115/repos/updates" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "gpgcheck=0" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 " >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "enabled=1" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "#Repositório epel" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "[Autoseg-epel]" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "name=CentOS- - AutosegEpel" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "baseurl=http://10.255.18.115/repos/epel" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "gpgcheck=0" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/echo  "enabled=1 " >> /etc/yum.repos.d/Autoseg.repo
RUN /bin/yum clean all && /bin/yum update -y 
# Instalando os pacotes básicos
RUN /bin/yum install vim net-tools tar bzip2 \
igzip wget telnet tcpdump curl openssl httpd httpd-tools \
    httpd-devel libcurl-devel apr-devel apr-util-devel gcc-c++ which gnupg2 bash mod_passenger mod_ssl -y
#Instalando o RVM
#RUN  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E37D2BAF1CF37B13E2069D6956105BD0E739499BDB 
RUN \curl -sSL https://get.rvm.io | bash
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install ruby-2.5.0"
RUN /bin/bash -l -c "rvm --default use ruby-2.5.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install rack -v=1.4.7"
#Configurando o Passenger
RUN /bin/rm -f /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "<IfModule mod_passenger.c>" > /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "passengerRoot /usr/share/passenger//phusion_passenger/locations.ini" >>\
    /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "PassengerRuby /usr/local/rvm/wrappers/ruby-2.5.0@global" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "</IfModule>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "<IfModule mod_headers.c>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Header set X-XSS-Protection "1; mode=block"" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Header always append X-Frame-Options SAMEORIGIN" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Header set X-Content-Type-Options nosniff" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Header set Strict-Transport-Security "max-age=31536000"" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "</IfModule>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "TraceEnable off">> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "<VirtualHost *:80>">> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "ServerName pmautoseg.com.br" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "ServerAlias www.pmautoseg.com.br" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "DocumentRoot /autoseg/var/www/sso/public" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Redirect / https://pmautoseg.com.br/" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "</VirtualHost>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "<IfModule mod_ssl.c>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLStaplingResponderTimeout 5" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLStaplingReturnResponderErrors off" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLStaplingCache        shmcb:/var/run/ocsp(128000)" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "<VirtualHost *:443>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLEngine On" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLProtocol -all +TLSv1.2" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLHonorCipherOrder On" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLCertificateKeyFile /data/srv-repository.local.key" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLCertificateFile /data/srv-repository.local.crt" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "SSLUseStapling on" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "ServerName https://pmautoseg.com.br/" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "ServerAlias www.pmautoseg.com.br/" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "DocumentRoot /autoseg/var/www/sso/public" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "<Directory /autoseg/var/www/sso/public>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Require all granted" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "Options -MultiViews" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "</Directory>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "</VirtualHost>">> /etc/httpd/conf.d/passenger.conf
RUN /bin/echo "</IfModule>" >> /etc/httpd/conf.d/passenger.conf
RUN /bin/touch /etc/httpd/conf.d/mod_deflate.conf
RUN /bin/echo -e '<filesMatch "\.(js|html|txt|css)$">\nSetOutputFilter DEFLATE\n</filesMatch>\nDeflateCompressionLevel 7\nDeflateMemLevel 8\nDeflateWindowSize 10\n' >> /etc/httpd/conf.d/mod_deflate.conf
#RUN /bin/mkdir -p /autoseg/var/www
#RUN useradd -ms /bin/bash deployer
#RUN /bin/chown deployer:deployer -R /autoseg/ && /bin/chown -R deployer: /usr/local/rvm/gems/ruby-2.5.0
#VOLUME /data
COPY srv-repository.local.crt /data/
COPY srv-repository.local.key /data/
#RUN /bin/wget  http://10.255.18.115/docker/sso.tar -P /autoseg/var/www
#RUN /bin/tar -xvf /autoseg/var/www/sso.tar -C /autoseg/var/www
#RUN /autoseg/var/www/sso/bin/setup
#USER deployer
#WORKDIR /autoseg/var/www
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
# Compartilhando arquivos do banco de dados
EXPOSE 80 443

