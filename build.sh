#!/usr/bin/env bash

docker build -t api-docs .
docker run --name api-docs-build --rm -it -v `pwd`:/api-docs api-docs:latest  bundle exec middleman build
