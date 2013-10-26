#!/bin/bash

sudo docker build -t poche .

CONTAINER_ID=$(sudo docker run -d poche)

PORT=$(sudo docker port $CONTAINER_ID 80)

echo
echo
echo "Runing on port $PORT"
echo "sensible-browser http://localhost:$PORT/yourpoche"
echo
echo "Stop with :"
echo "sudo docker stop $CONTAINER_ID"
