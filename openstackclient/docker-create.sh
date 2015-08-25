#!/bin/bash

if [ -z "${TOKEN+x}" ] ;
then
 echo #TOKEN must be set
 echo 'TOKEN=$(docker run --rm swarm create)'
 echo export TOKEN
 exit 1
fi

IMAGE=${IMAGE:-ubuntu_docker_14.04}
SSHUSER=${SSHUSER:-stack}
FLAVOR=${FLAVOR:-2_vCPU_RAM_8G_HD_10G}
NODENAME=swarm-node-${1:-00}
MASTER=

if [ "${1}" == 'master' ] ;
then
   NODENAME=swarm-master
   MASTER=--swarm-master
   shift
fi


docker-machine -D create --driver openstack --openstack-flavor-name ${FLAVOR} --openstack-image-name ${IMAGE} --openstack-net-name net-001 --openstack-ssh-user ${SSHUSER} --swarm ${MASTER} --swarm-discovery token://$TOKEN $NODENAME

if [ "$?" != 0 ] ;
then
 echo docker-machine rm -f $NODENAME
 exit
fi

if [ ! -z "$MASTER" ] ;
then
  echo 'eval $(docker-machine env --swarm' $NODENAME ')'
fi
