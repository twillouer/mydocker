FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y python-software-properties software-properties-common curl

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

RUN cd / && curl -o - http://archive.apache.org/dist/tomcat/tomcat-5/v5.5.25/bin/apache-tomcat-5.5.25.tar.gz | tar xvzf -

RUN mv /apache-tomcat-5.5* /tomcat

#RUN useradd tomcat --home-dir /tomcat
#RUN chown -R tomcat.tomcat /tomcat /tomcat/*

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/jre
#USER tomcat

EXPOSE 8080

CMD ["/tomcat/bin/catalina.sh", "run"]
