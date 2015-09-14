#!/bin/bash

#
# Usage
#  $0 <hostname> --swarm-master
#  $0 <hostname>
#
#

if [ -z "${1+x}" ] ;
then
  echo "Usage : $0" '<node-name> [options to docker-machine]'
  echo 'options can be, for example --swarm-master'
  echo "or --engine-insecure-registry $(hostname -I | cut -d" " -f1):5000"
  exit
fi

if [ -z "${TOKEN+x}" ] ;
then
 echo '#TOKEN must be set'
 echo 'export TOKEN=$(docker run --rm swarm create)'
 exit 1
fi

IMAGE=${IMAGE:-ubuntu_docker_14.04}
SSHUSER=${SSHUSER:-stack}
FLAVOR=${FLAVOR:-2_vCPU_RAM_8G_HD_10G}
NODENAME=${1}
MASTER=

shift

#if [ "${1}" == 'master' ] ;
#then
#   NODENAME=swarm-master
#   MASTER=--swarm-master
#   shift
#fi

echo Create machine $NODENAME with options $*

docker-machine -D create --driver openstack --openstack-flavor-name ${FLAVOR} --openstack-image-name ${IMAGE} --openstack-net-name net-001 --openstack-ssh-user ${SSHUSER} --swarm $* --swarm-discovery token://$TOKEN $NODENAME

if [ "$?" != 0 ] ;
then
 echo docker-machine rm -f $NODENAME
 exit
fi

if [ ! -z "$MASTER" ] ;
then
  echo 'eval $(docker-machine env --swarm' $NODENAME')'
else
  echo 'eval $(docker-machine env' $NODENAME')'
fi
