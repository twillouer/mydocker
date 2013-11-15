#!/bin/bash

# Params :
# - dbpath where to store db

# if you want to change the container name.
CONTAINERNAME=extremestartup

if sudo docker images $CONTAINERNAME | grep -q $CONTAINERNAME ;
then
 :
else
 sudo docker build -t $CONTAINERNAME . || exit
fi

CONTAINER_ID=$(sudo docker run -d -p=3000:3000 $CONTAINERNAME)
PORT=$(sudo docker port $CONTAINER_ID 3000 | cut -d ":" -f 2)

echo
echo
echo "#Runing on port $PORT"
echo "sensible-browser http://localhost:$PORT"
echo
echo "#Stop with :"
echo "sudo docker stop $CONTAINER_ID"
