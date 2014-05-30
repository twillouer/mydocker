#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/

DATA=$(readlink -f ${1:-data})
mkdir -p $DATA

sudo docker --rm build -t mongodb . || exit

# Lean and mean
MONGO_ID=$(sudo docker run -p=27017 -p=28017 -v=$DATA:/data/db -d mongodb --noprealloc --smallfiles)
PORT=$(sudo docker port $MONGO_ID 27017 | cut -d":" -f2)
WEBPORT=$(sudo docker port $MONGO_ID 28017 | cut -d":" -f2)

echo ID : $MONGO_ID
echo
echo
echo "##to connect : "
echo "mongo --port $PORT"
echo

echo "##webadmin : "
echo "sensible-browser http://localhost:$WEBPORT"
echo

# Check the logs out
echo "##Check the logs : "
echo "sudo docker logs $MONGO_ID"
