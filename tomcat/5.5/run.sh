#!/bin/bash

function usage()
{
 echo "Run a war into a tomcat 5.5 container"
 echo "Usage : $0 <path to a war>"
 exit 1
}

function findAndBuildDocker()
{
 docker images | grep "$1" > /dev/null || docker build -t "$1" .
}

findAndBuildDocker tomcat55

if [ "$1" == "" ];
then
 usage
fi

WAR=$(readlink -f "$1")

if [ ! -r "$WAR" ];
then
 echo "Impossible to read $WAR"
 usage
fi

TEMPDIR=$(mktemp -d)

ln -s "$WAR" "$TEMPDIR"


CONTAINER_ID=$(docker run -d -P -v="$TEMPDIR":/tomcat/webapps tomcat55)
PORT=$(docker port $CONTAINER_ID 8080 | cut -d ":" -f 2)

echo "\nTomcat 5.5 running on local post $PORT"
echo "To stop : "
echo "docker stop $CONTAINER_ID && rm -rf $TEMPDIR"
