

DOCKER_NAME=$(\
    echo $PWD |\
        cut -c2- |\
        tr '[:upper:]' '[:lower:]' |\
        sed "s/ /_/g;s/-/_/g;s/\//_/g;s/\.//g;"
)
DOCKER_NAME="$DOCKER_NAME:latest"
echo $DOCKER_NAME