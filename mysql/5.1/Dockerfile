FROM ubuntu:vivid
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu vivid main restricted universe multiverse\n" > /etc/apt/sources.list && \
	apt-get update && apt-get install -y wget && \
	wget -S -O - http://downloads.mysql.com/archives/get/file/mysql-5.1.71-linux-x86_64-glibc23.tar.gz | tar xvzf - && \
        apt-get purge -y --auto-remove wget && \
	mv mysql-5.1.* /usr/local/mysql && \
	groupadd mysql && \
	useradd mysql -g mysql -d /usr/local/mysql && \
	chown mysql.mysql -R /usr/local/mysql && \
	cd /usr/local/mysql && rm -rf data && \
	 ./scripts/mysql_install_db --user=mysql

WORKDIR /usr/local/mysql
RUN ./bin/mysqld_safe & while ! (echo "SHOW DATABASES;" | ./bin/mysql -u root 2>&1 > /dev/null); do sleep 1; done && ./bin/mysql -u root -e "CREATE USER 'docker'@'%' IDENTIFIED BY 'docker'; GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"  

# Expose mysql port
EXPOSE 3306

ENTRYPOINT ["/usr/local/mysql/bin/mysqld_safe"]

