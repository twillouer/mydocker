#!/bin/bash

CONTAINER_ID=$(sudo docker build  - < mitmproxy.docker)

sudo docker top

echo "Container for mitmproxy : ${CONTAINER_ID}"
