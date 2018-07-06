#!/usr/bin/env bash

DIRECTORY=$(cd `dirname $0` && pwd)

docker build -t api-docs:latest ${DIRECTORY}/.
docker run --rm -it -v ${DIRECTORY}:/api-docs api-docs:latest bundle exec middleman build
cp -a ${DIRECTORY}/build/. ${DIRECTORY}/../public/docs/
