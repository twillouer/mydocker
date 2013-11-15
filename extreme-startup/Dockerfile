FROM ubuntu:quantal
MAINTAINER William Delanoue, william.delanoue@gmail.com
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu quantal main restricted universe multiverse\n" \
          > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget unzip curl git

# Install Ruby
RUN curl -L https://get.rvm.io | bash -s stable --ruby

RUN bash -c "source /usr/local/rvm/scripts/rvm && rvm rubygems current && gem install bundler"

# See http://nokogiri.org/tutorials/installing_nokogiri.html
RUN apt-get install -y libxslt-dev libxml2-dev

#RUN git clone https://github.com/rchatley/extreme_startup.git /extreme
RUN git clone https://github.com/twillouer/extreme_startup.git /extreme
WORKDIR /extreme
RUN bash -c "source /usr/local/rvm/scripts/rvm && bundle install"


EXPOSE 3000
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "source /usr/local/rvm/scripts/rvm && ruby web_server.rb"]
