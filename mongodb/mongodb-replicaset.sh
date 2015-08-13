#!/bin/bash

## see http://docs.docker.io/en/latest/examples/mongodb/

REPL_COUNT=${1:-3}

docker build --rm -t mongodb . || exit

CONFIGURATE="rs.initiate() ; sleep(15000); "

# Lean and mean
for i in $(seq 1 $REPL_COUNT) ; 
do
# --smallfiles --noprealloc --nojournal --oplogSize 10

  MONGO_ID=$(docker run -d -p=27017 mongodb --noprealloc --smallfiles --oplogSize 10 --nojournal --replSet docker) || exit
  PORT=$(docker port ${MONGO_ID} 27017 | cut -d":" -f2)
  # The primary will be the last 
  PRIMARY_PORT=$PORT
  IP=$(docker inspect ${MONGO_ID} | grep IPAddress | cut -d '"' -f 4)
  echo "Container n°$i : ${MONGO_ID} run on port ${PORT}" 
  CONFIGURATE="$CONFIGURATE ; rs.add('${IP}:27017') ;"
done

while ! docker logs $MONGO_ID | grep "waiting for connections on port 27017"
do 
echo $MONGO_ID
 docker logs $MONGO_ID
 sleep 2
done

echo "Configuration with :"
echo $CONFIGURATE

echo "$CONFIGURATE ; rs.status();" |  mongo --port $PRIMARY_PORT

echo "##to connect : "
echo "mongo --port $PRIMARY_PORT"
