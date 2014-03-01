FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com

RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y python-software-properties software-properties-common

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# Now sonar
RUN apt-get install -y wget unzip

# like the doc says : http://docs.codehaus.org/display/SONAR/Setup+and+Upgrade;jsessionid=335D84261ABD590887E0CC9A88206BDC
RUN wget http://dist.sonar.codehaus.org/sonarqube-4.1.2.zip 
RUN mkdir -p /srv && cd /srv && unzip /sonarqube-4.1.2.zip && rm /sonarqube-4.1.2.zip && ln -s sonarqube-4.1.2 sonarqube
RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.3/sonar-runner-dist-2.3.zip 
RUN cd /srv && unzip /sonar-runner-dist-2.3.zip && \
     rm /sonar-runner-dist-2.3.zip


EXPOSE 9000 9092
ENTRYPOINT ["/srv/sonarqube/bin/linux-x86-64/sonar.sh", "console"]
