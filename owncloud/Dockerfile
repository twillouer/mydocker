FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse\n" \
          > /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install wget

RUN wget "http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key" && sudo apt-key add - < Release.key 

RUN apt-get update
RUN apt-get -y install supervisor mysql-server
RUN apt-get -y install owncloud

RUN a2enmod ssl
RUN a2ensite default-ssl

RUN echo "[supervisord]\n"\
"nodaemon=true\n"\
"\n"\
"[program:mysql]\n"\
"command=/usr/bin/mysqld_safe\n"\
"\n"\
"[program:apache2]\n"\
"command=/usr/sbin/apache2ctl -D FOREGROUND\n"\
        > /etc/supervisor/conf.d/supervisord.conf


EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
