FROM ubuntu:utopic
MAINTAINER William Delanoue, william.delanoue@gmail.com

RUN echo "deb http://fr.archive.ubuntu.com/ubuntu utopic main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update && \
	apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y python-software-properties software-properties-common wget unzip

RUN add-apt-repository ppa:webupd8team/java && \
	apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# Now sonar

# like the doc says : http://docs.sonarqube.org/display/SONAR/Setup+and+Upgrade
RUN wget http://dist.sonar.codehaus.org/sonarqube-5.0.zip && \
	mkdir -p /srv && cd /srv && unzip /sonarqube-5.0.zip && rm /sonarqube-5.0.zip && ln -s sonarqube-5.0 sonarqube
RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip && \
     cd /srv && unzip /sonar-runner-dist-2.4.zip && \
     rm /sonar-runner-dist-2.4.zip


EXPOSE 9000 9092
ENTRYPOINT ["/srv/sonarqube/bin/linux-x86-64/sonar.sh", "console"]
