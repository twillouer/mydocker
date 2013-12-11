FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
         "deb http://www.rabbitmq.com/debian/ testing main\n" \
          > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y wget

# add rabbitmq key
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc && sudo apt-key add rabbitmq-signing-key-public.asc

RUN apt-get update
RUN apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server

