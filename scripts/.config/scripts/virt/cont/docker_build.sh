#!/bin/sh


DOCKER_NAME=$(docker_container_name)

sudo docker build . -t "$DOCKER_NAME"
