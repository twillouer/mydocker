FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y python-software-properties software-properties-common curl

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer tomcat7

#RUN useradd tomcat --home-dir /tomcat
#RUN chown -R tomcat.tomcat /tomcat /tomcat/*

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/jre
#USER tomcat

EXPOSE 8080

CMD ["/etc/init.d/tomcat7", "run"]
