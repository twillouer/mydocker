#!/bin/bash

sudo docker build -t twillouer/mitmproxy .

echo "Container for mitmproxy done"

sudo docker run -i -t -p=8080:8080 twillouer/mitmproxy
