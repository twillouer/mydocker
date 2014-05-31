#!/bin/bash

docker build --rm -t owncloud .

OWNCLOUD_DIR=${OWNCLOUD_DIR:-$HOME/owncloud}

mkdir -p $OWNCLOUD_DIR/data $OWNCLOUD_DIR/mysql

echo docker run -p=82:80 -v=$OWNCLOUD_DIR/data:/usr/share/owncloud/data -v=$OWNCLOUD_DIR/mysql:/var/lib/mysql -t -i owncloud bash
docker run -p=82:80 -d -v=$OWNCLOUD_DIR/data:/usr/share/owncloud/data:rw -v=$OWNCLOUD_DIR/mysql:/var/lib/mysql:rw owncloud
