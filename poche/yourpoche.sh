#!/bin/bash

# Params :
# - dbpath where to store db

DBPATH=${1:-db}


# Full path
DBPATH=$(readlink -f $DBPATH)

# Create directory if not exist
mkdir -p "$DBPATH"

echo "Real storage will be in $DBPATH"

# if you want to change the container name.
CONTAINERNAME=poche

if sudo docker images $CONTAINERNAME | grep -q $CONTAINERNAME ;
then
 :
else
 sudo docker build -t $CONTAINERNAME . || exit
fi

if [ ! -f $DBPATH/poche.sqlite ] ;
then
 echo "#Export poche.sqlite from container image to filesystem, in $DBPATH"
 sudo docker run --entrypoint="/bin/bash" $CONTAINERNAME -c "cat /var/www/db/poche.sqlite" > "$DBPATH/poche.sqlite" || exit
fi

sudo chmod 777 "$DBPATH" "$DBPATH/poche.sqlite"

CONTAINER_ID=$(sudo docker run -d -v=$DBPATH:/var/www/db -p=8001:80 $CONTAINERNAME)
PORT=$(sudo docker port $CONTAINER_ID 80)

echo
echo
echo "#Runing on port $PORT"
echo "sensible-browser http://localhost:$PORT"
echo
echo "#Stop with :"
echo "sudo docker stop $CONTAINER_ID"
