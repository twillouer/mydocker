FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget unzip curl
RUN apt-get install -y apache2 php5 libapache2-mod-php5
RUN apt-get install -y php5-sqlite
RUN wget https://github.com/inthepoche/poche/archive/1.1.0.zip -O poche.zip
RUN unzip poche.zip
RUN rm poche.zip
WORKDIR /poche-1.1.0
RUN curl -s http://getcomposer.org/installer | php && php composer.phar install
RUN mv inc/poche/config.inc.php.new inc/poche/config.inc.php

# Setup salt
RUN sed -i -e "s/'SALT', ''/'SALT', '$(dd if=/dev/urandom count=1 2> /dev/null | openssl dgst -sha1 |awk '{print $NF}')'/" inc/poche/config.inc.php

# Setup sqlite
RUN cp install/poche.sqlite db

# Can access anything
RUN chmod 777 -R assets/ cache/ db/

# Remove unused directory
RUN rm -rf install

# Move to right path
WORKDIR /var/www
RUN mv /poche-1.1.0 /var/www/yourpoche

# Expore Apache2
EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
