FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
#RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# Hack for initctl not being available in Ubuntu
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl || echo "/sbin/initctl already exist" ; ls -latr /sbin/initctl

# Install MongoDB
RUN apt-get update
RUN apt-get install -y mongodb-org=3.0.3

# Create the MongoDB data directory
RUN mkdir -p /data/db

EXPOSE 27017 28017
ENTRYPOINT ["/usr/bin/mongod"]
CMD ["--noprealloc", "--smallfiles", "--storageEngine", "wiredTiger"]

