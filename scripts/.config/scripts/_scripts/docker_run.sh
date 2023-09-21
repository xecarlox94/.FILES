#!/bin/sh


if [ $# -eq 0 ];
then
    echo "not enough args"
    exit 1
fi


RUN_CMD="$1"

DOCKER_ARGS="$2"


DOCKER_NAME=$(echo $PWD | xargs basename | tr '[:upper:]' '[:lower:]' | sed "s/-/_/g;s/\//_/g;s/\.//g")
DOCKER_NAME="$DOCKER_NAME:latest"


CMD="\
    sudo docker run \
    $DOCKER_ARGS \
    --gpus all --privileged \
    -it --rm \
    $DOCKER_NAME \
    $RUN_CMD \
"


eval "$CMD"


