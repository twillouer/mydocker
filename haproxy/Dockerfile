FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y haproxy

EXPOSE 80

ADD auto-link-other-containers.sh /
ADD haproxy.template.cfg /etc/haproxy/
RUN chmod +x auto-link-other-containers.sh

ENTRYPOINT ["/auto-link-other-containers.sh"]
