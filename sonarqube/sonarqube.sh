#!/bin/bash

docker build --rm -t sonarqube . || exit

# Lean and mean
ID=$(docker run -d -p=9000:9000 -p=9092:9092  sonarqube)
PORT=$(docker port ${ID} 9000 | cut -d":" -f2)

echo ID : $ID
echo "##to connect : "
echo "sensible-browser http://localhost:$PORT"

# Check the logs out
echo "##Check the logs : "
echo "docker logs $ID"
