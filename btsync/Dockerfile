FROM ubuntu

MAINTAINER Bill Thornton <billt2006@gmail.com>

# Install curl
RUN apt-get update && apt-get install -y curl
# Download and extract the executable to /usr/bin
RUN cd /usr/bin && curl -o - http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable | tar xvzf - && chown root.root btsync

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
