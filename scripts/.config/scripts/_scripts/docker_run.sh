#!/bin/sh


if [ $# -lt 1 ];
then
    echo "not enough args"
    exit 1
fi


RUN_CMD="$1"

DOCKER_ARGS="$2"


DOCKER_NAME=$(echo $PWD | xargs basename | tr '[:upper:]' '[:lower:]' | sed "s/-/_/g;s/\//_/g;s/\.//g")
DOCKER_NAME="$DOCKER_NAME:latest"


# # --- Pulse Audio / Mic and Speakers - Too much to comment, but it's all needed... I think ----------------------
#     -v /dev/snd:/dev/snd  \
#     -v /run/user/$uid/puslse:/run/user/$uid/pulse \
#     -v /dev/shm:/dev/shm \
#     -v /etc/machine-id:/etc/machine-id \
#     -v /var/lib/dbus:/var/lib/dbus \
#     -v ~/.pulse:/home/$dockerUsername/.pulse \
#     -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
#     -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
#     -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
#     --device /dev/snd \
# # ----------------------------




CMD="\
    sudo docker run \
    $DOCKER_ARGS \
    --gpus all --privileged \
    -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    $DOCKER_NAME \
    $RUN_CMD \
"

# https://vsupalov.com/docker-shared-permissions/
    # --user \"$(id -u):$(id -g)\" \

eval "$CMD"


