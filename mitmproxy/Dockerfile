FROM ubuntu:utopic
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && apt-get update
RUN apt-get install -y python-pip build-essential python-dev libevent1-dev  libxml2-dev libxslt-dev libffi-dev libssl-dev
RUN pip install --upgrade pip
RUN pip install mitmproxy

# Expose port
EXPOSE 8080

# mitmproxy need utf8
ENV LANG en_US.UTF-8

ENTRYPOINT ["mitmproxy"]

