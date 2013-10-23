#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/

sudo docker build -t twillouer/mongodb - < mongodb.docker 

# Lean and mean
MONGO_ID=$(sudo docker run -d twillouer/mongodb --noprealloc --smallfiles)
PORT=$(sudo docker ps | grep mongod | tail -1 | tr -s " " ":" | sed -e "s/.*:\([0-9]*\)->[0-9]*:/\1/")

echo ID : $MONGO_ID
echo "##to connect : "
echo "mongo --port $PORT"

# Check the logs out
echo "##Check the logs : "
echo "sudo docker logs $MONGO_ID"
