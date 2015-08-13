FROM ubuntu:latest

ADD https://bootstrap.pypa.io/get-pip.py /get-pip.py

RUN apt-get update && apt-get install -y python-dev libffi-dev libssl-dev &&\
    python /get-pip.py &&\
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
        pip install python-flameclient ;\
    apt-get autoremove && apt-get clean
