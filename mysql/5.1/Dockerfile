FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN cat /proc/mounts > /etc/mtab
RUN apt-get update
RUN apt-get install -y wget

RUN wget -S -O - http://downloads.mysql.com/archives/get/file/mysql-5.1.61-linux-x86_64-glibc23.tar.gz | tar xvzf - 

RUN mv mysql-5.1.* /usr/local/mysql

RUN groupadd mysql
RUN useradd mysql -g mysql -d /usr/local/mysql

RUN chown mysql.mysql -R /usr/local/mysql

RUN cd /usr/local/mysql && rm -rf data &&  ./scripts/mysql_install_db --user=mysql

WORKDIR /usr/local/mysql
RUN ./bin/mysqld_safe & while ! (echo "SHOW DATABASES;" | ./bin/mysql -u root 2>&1 > /dev/null); do sleep 1; done && ./bin/mysql -u root -e "CREATE USER 'docker'@'%' IDENTIFIED BY 'docker'; GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"  

# Expose mysql port
EXPOSE 3306

ENTRYPOINT ["/usr/local/mysql/bin/mysqld_safe"]

