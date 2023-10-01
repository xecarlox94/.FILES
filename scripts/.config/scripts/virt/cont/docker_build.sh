#!/bin/sh




DOCKER_NAME=$(get_container_name.sh)

sudo docker build . -t "$DOCKER_NAME"
