#!/bin/bash

if [ "$1" == "" ] ;
then
   echo "$0 <nom du fichier .sh donné par openstack>"
   exit
fi


#docker build --rm  -t=openstackclient .

FILE=$(readlink -ev "$1")
#chmod +x "$FILE"

docker run -v="$FILE:/credential.sh" -ti openstackclient bash -ci 'source /credential.sh; bash'
