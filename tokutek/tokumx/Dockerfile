FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 505A7412
#RUN echo "deb [arch=amd64] http://s3.amazonaws.com/tokumx-debs wheezy main" \ 
RUN echo "deb [arch=amd64] http://s3.amazonaws.com/tokumx-debs $(lsb_release -cs) main" \ 
| tee /etc/apt/sources.list.d/tokumx.list
RUN apt-get update && apt-get install tokumx -y

RUN mkdir -p /data/db/
RUN chown -R tokumx.tokumx /data

# Expose mongodb port
EXPOSE 27017 28017

ENTRYPOINT /usr/bin/mongod
CMD ["--noprealloc", "--smallfiles"]
