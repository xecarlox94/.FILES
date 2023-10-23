#!/bin/sh


if [ $# -lt 2 ];
then
    echo "not enough args"
    exit 1
fi



RUN_CMD="$1"

DOCKER_ARGS="$2"


shift 2


X11=false
NVIDIA=false

while getopts 'xn' OPTION;
do
    case "$OPTION" in
        x)
            X11=true
            ;;
        n)
            NVIDIA=true
            ;;
        *)
            echo "NOTHING"
            ;;
    esac
done



DOCKER_NAME=$(get_container_name.sh)


#echo "__DOCKER_CONTAINER_NAME__: $DOCKER_NAME"




# # --- Pulse Audio / Mic and Speakers - Too much to comment, but it's all needed... I think ----------------------
#     -v /dev/snd:/dev/snd  \
#     -v /run/user/$uid/puslse:/run/user/$uid/pulse \
#     -v /dev/shm:/dev/shm \
#     -v /etc/machine-id:/etc/machine-id \
#     -v /var/lib/dbus:/var/lib/dbus \
#     -v ~/.pulse:/home/$dockerUsername/.pulse \
#     -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
#     -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
#     -v /dev/bus/usb:/dev/bus/usb \
#     -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
#     --device /dev/snd \
# # ----------------------------


# USER PERMISSION
# https://vsupalov.com/docker-shared-permissions/
    # --user \"$(id -u):$(id -g)\" \


#-e TERM \
    #-e QT_X11_NO_MITSHM=1 \
    #-e XAUTHORITY=/tmp/.dockerw_b717qf.xauth \
    #-v /tmp/.dockerw_b717qf.xauth:/tmp/.dockerw_b717qf.xauth \
    #-v /tmp/.X11-unix:/tmp/.X11-unix \



X11_OPTS="\
-e TERM \
-e DISPLAY=unix$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
"

NVIDIA_OPTS="\
-e NVIDIA_VISIBLE_DEVICES=${NVIDIA_VISIBLE_DEVICES:-all} \
-e NVIDIA_DRIVER_CAPABILITIES=${NVIDIA_DRIVER_CAPABILITIES:-all} \
--runtime=nvidia \
--gpus all \
"


XHOST=""
ADD_OPTS=""


if $X11;
then
    XHOST="xhost +local:root && "
    ADD_OPTS="$X11_OPTS "
fi


if $NVIDIA;
then
    ADD_OPTS="$ADD_OPTS $NVIDIA_OPTS"
fi

CMD="\
$XHOST \
sudo docker run \
-it \
-v $HOME/.config/.FILES:/root/.config/.FILES \
$DOCKER_ARGS \
$ADD_OPTS \
$DOCKER_NAME \
$RUN_CMD \
"

#echo "$CMD"

eval "$CMD"
