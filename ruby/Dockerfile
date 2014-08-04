FROM ubuntu:trusty
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential\
	libc6-dev\
	bison\
	openssl\
	libreadline6\
	libreadline6-dev\
	zlib1g\
	zlib1g-dev\
	libssl-dev\
	libyaml-dev\
	libxml2-dev\
	libxslt1-dev\
	autoconf\
	git\
	curl

RUN git clone git://github.com/sstephenson/rbenv.git ~/.rbenv && mkdir -p ~/.rbenv/plugins && cd ~/.rbenv/plugins && git clone git://github.com/sstephenson/ruby-build.git 

# Création du .rbenvrc
RUN echo 'if [ -d "$HOME/.rbenv" ] ; then'\\n\
 ' if ! echo $PATH | grep -q rbenv; then'\\n\
 '   export PATH="$HOME/.rbenv/bin:$PATH"'\\n\
 '   eval "$(rbenv init -)"'\\n\
 ' fi'\\n\
fi >  ~/.rbenvrc

#Ajouter l'appel au fichier dans les scripts démarrage SHELL:
RUN echo 'source ~/.rbenvrc' >> ~/.bashrc

RUN chsh -s /bin/bash

RUN cd ~ ; bash -c "source .rbenvrc && rbenv install 2.0.0-p247 && rbenv global 2.0.0-p247"


