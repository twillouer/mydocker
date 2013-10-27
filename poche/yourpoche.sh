#!/bin/bash

# if you want to change the container name.
CONTAINERNAME=poche

sudo docker images $CONTAINERNAME | grep $CONTAINERNAME || sudo docker build -t $CONTAINERNAME . || exit

CONTAINER_ID=$(sudo docker run -d $CONTAINERNAME)
PORT=$(sudo docker port $CONTAINER_ID 80)

echo
echo
echo "Runing on port $PORT"
echo "sensible-browser http://localhost:$PORT"
echo
echo "Stop with :"
echo "sudo docker stop $CONTAINER_ID"
