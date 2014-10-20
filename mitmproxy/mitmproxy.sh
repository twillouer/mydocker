#!/bin/bash

docker build --rm -t twillouer/mitmproxy .

echo "Container for mitmproxy done"

sudo docker run --rm -i -t -p=8080:8080 twillouer/mitmproxy
