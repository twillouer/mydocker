FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN cat /proc/mounts > /etc/mtab
RUN apt-get update
RUN apt-get install -y wget

# follow instruction from pdf
RUN groupadd -g 927 mysql
RUN useradd -r -u 927 -g mysql mysql
RUN mkdir -pv /opt/tokutek
#RUN cd /opt/tokutek && wget http://www.tokutek.com/download.php?df=1 && tar xvzf *.tar.gz
ADD mysql-5.5.30-tokudb-7.1.0-linux-x86_64.tar.gz /opt/tokutek
#RUN cd /opt/tokutek && tar xvzf mysql-5.5.30-tokudb-7.1.0-linux-x86_64.tar.gz
RUN cd /opt/tokutek && \
    ln -sv mysql-5.5.30-tokudb-7.1.0-linux-x86_64 mysql &&\
    cd mysql &&\
    chown -Rv mysql.mysql . &&\
    cp -v support-files/my-small.cnf /etc/my.cnf

RUN apt-get install -y libaio1

RUN mkdir /var/lib/mysql && chown -R mysql.mysql /var/lib/mysql

RUN cd /opt/tokutek/mysql && ./scripts/mysql_install_db --user=mysql  --basedir=/opt/tokutek/mysql --datadir=/var/lib/mysql

RUN sed -i "s/^basedir=/basedir=\/opt\/tokutek\/mysql/" /opt/tokutek/mysql/support-files/mysql.server
RUN sed -i "s/^datadir=/datadir=\/var\/lib\/mysql/" /opt/tokutek/mysql/support-files/mysql.server

RUN sed -i "s/^\[mysqld\]$/[mysqld]\nbasedir=\/opt\/tokutek\/mysql\ndatadir=\/var\/lib\/mysql\nuser=mysql\n/" /etc/my.cnf

WORKDIR /opt/tokutek/mysql

RUN ./bin/mysqld_safe & sleep 1 && while ! (echo "SHOW DATABASES;" | ./bin/mysql -u root 2>&1 > /dev/null); do sleep 1; done && ./bin/mysql -u root -e "CREATE USER 'docker'@'%' IDENTIFIED BY 'docker'; GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"  

# Expose mysql port
EXPOSE 3306


ENTRYPOINT ["./bin/mysqld_safe"]
