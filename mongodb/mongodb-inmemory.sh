#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/
## see http://java.dzone.com/articles/how-use-mongodb-pure-memory-db

docker build --rm -t mongodb . || exit

TMPDIR=$(mktemp -d)
sudo mount -t tmpfs -o size=16000M tmpfs $TMPDIR || exit

# Lean and mean
MONGO_ID=$(docker run -d -p=27017 -v="$TMPDIR":/data/db mongodb --noprealloc --smallfiles --storageEngine wiredTiger)
PORT=$(docker port $MONGO_ID 27017 | cut -d":" -f2)

echo ID : $MONGO_ID
echo "##to connect : "
echo "mongo --port $PORT"

# Check the logs out
echo "##Check the logs : "
echo "docker logs $MONGO_ID"

echo
# When done
echo "##When done : "
echo "docker stop $MONGO_ID"
echo "docker rm $MONGO_ID"
echo "umount $TMPDIR"
