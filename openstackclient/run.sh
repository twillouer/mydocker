#!/bin/bash

if [ "$1" == "" ] ;
then
   echo "$0 <nom du fichier .sh donné par openstack>"
   exit
fi


docker build --rm  -t=twillouer/mydocker:openstackclient .

FILE=$(readlink -ev "$1")
#chmod +x "$FILE"

shift

docker run -v="$FILE:/credential.sh" -ti $* twillouer/mydocker:openstackclient bash -ci 'source /credential.sh; bash'
