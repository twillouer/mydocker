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

# Make sure that Upstart won't try to start RabbitMQ after apt-get installs it
# https://github.com/dotcloud/docker/issues/446
RUN echo "exit 101" > /usr/sbin/policy-rc.d && chmod 755 /usr/sbin/policy-rc.d

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server

RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management

# Port for RabbitMQ
EXPOSE 5672 15672

CMD /usr/sbin/rabbitmq-server
