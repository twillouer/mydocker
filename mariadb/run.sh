#!/bin/sh

docker build --rm -t=mariadb .

docker run -d -p=3306:3306 mariadb
