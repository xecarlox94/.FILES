#!/bin/sh

DOCKER_NAME=$(echo $PWD | xargs basename | tr '[:upper:]' '[:lower:]' | sed "s/-/_/g;s/\//_/g;s/\.//g")
DOCKER_NAME="$DOCKER_NAME:latest"

sudo docker build . -t "$DOCKER_NAME"
