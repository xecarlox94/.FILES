#!/bin/sh




DOCKER_NAME=$(get_container_name.sh)

sudo \
    \
    docker build . \
        -t "$DOCKER_NAME" \
        #
        #
        #  I need to add ARG environments to extend further things, such as:
        #
        #  adding user to container user group
        #
        #--build-arg BUILD_ENV=dev
