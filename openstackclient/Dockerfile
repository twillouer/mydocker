FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python-dev libffi-dev libssl-dev git curl &&\
    curl https://bootstrap.pypa.io/get-pip.py > /get-pip.py &&\
    python /get-pip.py &&\
    pip install pyopenssl ndg-httpsclient pyasn1 ;\
    pip install wrapt ;\
    pip install cryptography ;\
    pip install unicodecsv ;\
    pip install tablib ;\
    pip install ipaddr ;\
    pip install appdirs ;\
    pip install cmd2 ;\
    pip install python-novaclient ;\
    pip install python-heatclient ;\
    pip install python-glanceclient ;\
    pip install python-ceilometerclient ;\
    pip install python-cinderclient ;\
    pip install python-neutronclient ;\
    pip install python-swiftclient ;\
    pip install python-saharaclient ;\
    pip install python-troveclient ;\
    pip install python-openstackclient ;\
    apt-get autoremove && apt-get clean

#RUN cd /root && git clone https://github.com/stackforge/flame.git && cd /root/flame && pip install -r requirements.txt && python setup.py install

RUN curl -L https://github.com/docker/machine/releases/download/v0.4.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine
RUN curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN curl -sSL https://get.docker.com/ | sh
