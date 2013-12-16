FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get install -y python-software-properties software-properties-common
RUN apt-get install -y haproxy


#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update
#RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
#RUN apt-get install -y oracle-java7-installer

EXPOSE 80

ADD auto-link-other-containers.sh /
ADD haproxy.template.cfg /etc/haproxy/
RUN chmod +x auto-link-other-containers.sh
