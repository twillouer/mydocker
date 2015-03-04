#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/

docker build --rm -t mongodb . || exit

# Lean and mean
MONGO_ID=$(docker run -d -p=27017 mongodb --noprealloc --smallfiles --storageEngine wiredTiger)
PORT=$(docker port ${MONGO_ID} 27017 | cut -d":" -f2)

echo ID : $MONGO_ID
echo "##to connect : "
echo "mongo --port $PORT"

# Check the logs out
echo "##Check the logs : "
echo "docker logs $MONGO_ID"
