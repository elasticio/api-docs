#!/usr/bin/env bash

docker build -t api-docs .
CURRENT_DIR=$(pwd)
docker run -it -v $CURRENT_DIR:/api-docs name:api-docs  bundle exec middleman build
