#!/bin/bash

#usage : MONGO_PORT=:27017 ./mongodb-persist.sh [path to data directory]

## see http://docs.docker.io/en/latest/examples/mongodb/

DATA=$(readlink -f ${1:-data})
mkdir -p $DATA

sudo docker --rm build -t mongodb . || exit

# Lean and mean
MONGO_ID=$(sudo docker run -p=127.0.0.1:27017${MONGO_PORT} -p=127.0.0.1:28017 -v=$DATA:/data/db -d mongodb --noprealloc --smallfiles --storageEngine wiredTiger)
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
