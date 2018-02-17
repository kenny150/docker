FROM centos:7
MAINTAINER Kennedy Alvess <kennedy.santos@autoseg.com>
LABEL Passmonki Server
RUN /bin/yum install epel-release -y
RUN /bin/yum update -y && /bin/yum install vim net-tools tar bzip2 \
    gzip wget telnet tcpdump curl openssl httpd httpd-tools \
    httpd-devel libcurl-devel apr-devel apr-util-devel gcc-c++ which gnupg2 bash mod_ssl mod_passenger -y && /bin/yum clean all
RUN /bin/touch /etc/httpd/conf.d/passenger.conf
#=================================================================
RUN /bin/touch /etc/httpd/conf.d/mod_deflate.conf && \
#=================================================================
    /bin/echo -e '<filesMatch "\.(js|html|txt|css)$">\nSetOutputFilter DEFLATE\n</filesMatch>\nDeflateCompressionLevel 7\nDeflateMemLevel 8\nDeflateWindowSize 10\n\n' >> /etc/httpd/conf.d/mod_deflate
#==================================================================
RUN /bin/echo -e '<IfModule mod_headers.c>\nHeader set X-XSS-Protection "1; mode=block"\nHeader always append X-Frame-Options SAMEORIGIN\nHeader set X-Content-Type-Options nosniff\nHeader set Strict-Transport-Security "max-age=31536000"\n</IfModule>\n\n' >> /etc/httpd/conf.d/passenger.conf
#==================================================================
RUN /bin/echo -e 'TraceEnable off\n\n<VirtualHost *:80>\nServerName srv-sso-server.com.br\nServerAlias www.srv-sso-server.com.br\nDocumentRoot /autoseg/var/www/sso/public\nRedirect / https://srv-sso-server.com.br/app\n</VirtualHost>\n<IfModule mod_ssl.c>\nSSLStaplingResponderTimeout 5\nSSLStaplingReturnResponderErrors off\nSSLStaplingCache        shmcb:/var/run/ocsp(128000)\n<VirtualHost *:443>\nSSLEngine On\nSSLHonorCipherOrder On\nSSLCertificateKeyFile /etc/httpd/certs/ca.key\nSSLCertificateFile /etc/httpd/certs/ca.crt\nSSLUseStapling on\nServerName https://srv-sso-server.com.br/app\nServerAlias www.srv-sso-server.com.br/app\nDocumentRoot /autoseg/var/www/sso/public\n<Directory /autoseg/var/www/sso/public>\nRequire all granted\nOptions -MultiViews\n</Directory>\n</VirtualHost>\n</IfModule>\n\n' >> /etc/httpd/conf.d/passenger.conf
#=================================================================
RUN /bin/chmod 755 /etc/httpd/ -R && /bin/chown apache:apache /etc/httpd/ -R
VOLUME /etc/httpd/certs/
EXPOSE 80 443
#CMD ["-D", "FOREGROUND"]
#ENTRYPOINT ["/usr/sbin/httpd"]
