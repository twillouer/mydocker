#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/

DATA=$(readlink -f ${1:-data})
mkdir -p $DATA

sudo docker build -t twillouer/mongodb . || exit

# Lean and mean
MONGO_ID=$(sudo docker run -v=$DATA:/data/db -d twillouer/mongodb --noprealloc --smallfiles)
PORT=$(sudo docker port $MONGO_ID 27017)

echo ID : $MONGO_ID
echo "##to connect : "
echo "mongo --port $PORT"

# Check the logs out
echo "##Check the logs : "
echo "sudo docker logs $MONGO_ID"
