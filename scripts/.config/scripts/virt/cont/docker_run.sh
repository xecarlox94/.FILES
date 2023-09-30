#!/bin/sh


if [ $# -lt 1 ];
then
    echo "not enough args"
    exit 1
fi


RUN_CMD="$1"

DOCKER_ARGS="$2"


DOCKER_NAME=$(docker_container_name)


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


# COPY --from=glvnd /usr/share/glvnd/egl_vendor.d/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json
# ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:-all}


#-e TERM \
    #-e QT_X11_NO_MITSHM=1 \
    #-e XAUTHORITY=/tmp/.dockerw_b717qf.xauth \
    #-v /tmp/.dockerw_b717qf.xauth:/tmp/.dockerw_b717qf.xauth \
    #-v /tmp/.X11-unix:/tmp/.X11-unix \

X11_NVIDIA="\
    -e TERM \
    -e DISPLAY \
    -e NVIDIA_VISIBLE_DEVICES=${NVIDIA_VISIBLE_DEVICES:-all} \
    -e NVIDIA_DRIVER_CAPABILITIES=${NVIDIA_DRIVER_CAPABILITIES:-all} \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /etc/localtime:/etc/localtime:ro \
"
X11_NVIDIA=""

CMD="\
    sudo docker run \
    -it --rm \
    $DOCKER_ARGS \
    --privileged \
    $DOCKER_NAME \
    $RUN_CMD \
"

# https://vsupalov.com/docker-shared-permissions/
    # --user \"$(id -u):$(id -g)\" \

eval "$CMD"

