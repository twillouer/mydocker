#!/bin/bash

# Auto link to others containers
#
# Try to generate automaticaly the /etc/haproxy/haproxy.cfg
#
# see http://docs.docker.io/en/latest/use/working_with_links_names/
#

cd /etc/haproxy || exit 1
mv haproxy.cfg haproxy.old || exit 1
mv haproxy.template.cfg haproxy.cfg

INCREMENT=0
for i in $(set | grep "_PORT=\tcp") ;
do
 IP=$(echo $i | cut -d ":" -f 2 | cut -d "/" -f 3)
 PORT=$(echo $i | cut -d ":" -f 3)

 echo "	server srv${INCREMENT} ${IP}:${PORT} weight 1 maxconn 100 check inter 4000" >> haproxy.cfg
 INCREMENT=$((INCREMENT+1))
 echo $INCREMENT
done
