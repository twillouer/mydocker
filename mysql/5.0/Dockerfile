FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
         "deb http://ftp.igh.cnrs.fr/pub/mariadb/repo/5.5/ubuntu quantal main" \
          > /etc/apt/sources.list
RUN cat /proc/mounts > /etc/mtab
RUN apt-get update
RUN apt-get install -y wget curl

RUN wget -S -O - http://downloads.mysql.com/archives/get/file/mysql-5.0.51a-linux-i686.tar.gz | tar xvzf - 

#RUN tar xvzf mysql-*.tar.gz
#RUN rm mysql-*.tar.gz

RUN mv mysql-5.0.* /usr/local/mysql

RUN groupadd mysql
RUN useradd mysql -g mysql -d /usr/local/mysql

RUN chown mysql.mysql -R /usr/local/mysql

RUN cd /usr/local/mysql && rm -rf data &&  ./scripts/mysql_install_db --user=mysql

WORKDIR /usr/local/mysql
RUN ./bin/mysqld_safe & sleep 2 && ./bin/mysql -u root -e "CREATE USER 'docker'@'%' IDENTIFIED BY 'docker'; GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"  


WORKDIR /usr/local/mysql

#RUN sed -i -e '/^bind-address*/ s/^/#/' /etc/mysql/my.cnf
# Expose mysql port
EXPOSE 3306

ENTRYPOINT ["/usr/local/mysql/bin/mysqld_safe"]

