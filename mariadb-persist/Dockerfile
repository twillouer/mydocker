FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse\n" \
         "deb http://mirrors.linsrv.net/mariadb/mariadb-5.5.34/repo/ubuntu/ trusty main" \
          > /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN sed -i -e '/^bind-address*/ s/^/#/' /etc/mysql/my.cnf

#RUN service mysql stop

ADD chown.sh /chown.sh
RUN /bin/sh /chown.sh

# Expose mysql port
EXPOSE 3306

# USER mysql

ENTRYPOINT ["/usr/bin/mysqld_safe"]
