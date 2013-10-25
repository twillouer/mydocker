#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/

sudo docker build -t twillouer/mongodb - < mongodb.docker || exit

# Lean and mean
MONGO_ID=$(sudo docker run -d twillouer/mongodb --noprealloc --smallfiles)
PORT=$(sudo docker port $MONGO_ID)

echo ID : $MONGO_ID
echo "##to connect : "
echo "mongo --port $PORT"

# Check the logs out
echo "##Check the logs : "
echo "sudo docker logs $MONGO_ID"
