#!/bin/sh


SCRIPTS_DIR="/home/xecarlox/.config/scripts/_scripts"



$SCRIPTS_DIR/docker_build.sh &&\
    $SCRIPTS_DIR/docker_run.sh "$@"
