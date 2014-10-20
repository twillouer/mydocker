FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse\n" \
         "deb http://mirrors.linsrv.net/mariadb/mariadb-5.5.34/repo/ubuntu/ trusty main" \
          > /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN sed -i -e '/^bind-address*/ s/^/#/' /etc/mysql/my.cnf

RUN /usr/bin/mysqld_safe & while ! (echo "SHOW DATABASES;" | mysql -u root 2>&1 > /dev/null); do sleep 1; done && mysql -u root -e "CREATE USER 'docker'@'%' IDENTIFIED BY 'docker'; GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"  

# Expose mysql port
# Expose mysql port
EXPOSE 3306

ENTRYPOINT ["/usr/bin/mysqld_safe"]

