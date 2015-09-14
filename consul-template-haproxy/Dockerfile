# http://sirile.github.io/2015/05/18/using-haproxy-and-consul-for-dynamic-service-discovery-on-docker.html
FROM alpine
 
ENV CONSUL_TEMPLATE_VERSION=0.10.0

# Updata wget to get support for SSL
RUN apk --update add haproxy wget ca-certificates && \
    wget https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz -O /tmp/consul_template.tar.gz && \
    gunzip /tmp/consul_template.tar.gz && \
    cd /tmp && tar xf /tmp/consul_template.tar && cd /tmp/consul-template* && mv consul-template /usr/bin && \
    rm -rf /tmp/* && \
    apk del wget ca-certificates && \
    rm -rf /var/lib/apt/lists/* 
 
COPY haproxy.json /tmp/haproxy.json
COPY haproxy.ctmpl /tmp/haproxy.ctmpl

EXPOSE 80

CMD ["consul-template", "-config=/tmp/haproxy.json"]
