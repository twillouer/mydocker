#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/
## see http://java.dzone.com/articles/how-use-mongodb-pure-memory-db

sudo docker build -t twillouer/mongodb . || exit

TMPDIR=$(mktemp -d)
sudo mount -t tmpfs -o size=16000M tmpfs $TMPDIR || exit

# Lean and mean
MONGO_ID=$(sudo docker run -d -v="$TMPDIR":/data/db twillouer/mongodb --noprealloc --smallfiles --nojournal)
PORT=$(sudo docker port $MONGO_ID 27017 | cut -d":" -f1)

echo ID : $MONGO_ID
echo "##to connect : "
echo "mongo --port $PORT"

# Check the logs out
echo "##Check the logs : "
echo "sudo docker logs $MONGO_ID"

echo
# When done
echo "##When done : "
echo "sudo docker stop $MONGO_ID"
echo "sudo docker rm $MONGO_ID"
echo "sudo umount $TMPDIR"
