FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com

RUN apt-get update && apt-get install -y wget && apt-get autoclean

#RUN wget -S -O - http://downloads.mysql.com/archives/get/file/mysql-5.0.51a-linux-i686.tar.gz | tar xvzf - 
RUN wget http://downloads.mysql.com/archives/get/file/mysql-5.0.51a-linux-i686.tar.gz && tar xvzf mysql-5.0.51a-linux-i686.tar.gz && rm mysql-5.0.51a-linux-i686.tar.gz

RUN mv mysql-5.0.* /usr/local/mysql

RUN groupadd mysql
RUN useradd mysql -g mysql -d /usr/local/mysql

RUN chown mysql.mysql -R /usr/local/mysql

RUN cd /usr/local/mysql && rm -rf data &&  ./scripts/mysql_install_db --user=mysql

WORKDIR /usr/local/mysql
RUN ./bin/mysqld_safe & while ! (echo "SHOW DATABASES;" | ./bin/mysql -u root 2>&1 > /dev/null); do sleep 1; done && ./bin/mysql -u root -e "CREATE USER 'docker'@'%' IDENTIFIED BY 'docker'; GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"  

# Expose mysql port
EXPOSE 3306

ENTRYPOINT ["/usr/local/mysql/bin/mysqld_safe"]

