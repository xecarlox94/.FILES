#!/bin/env sh

exp_file_contents() {
    FILE=$1
    if [ -f $FILE ];
    then
        set -a
        source $FILE
        set +a
    else
        echo "error sourcing files from $FILE"
    fi
}

docker_container_name(){
    DOCKER_NAME=$(\
        echo $PWD |\
            cut -c2- |\
            tr '[:upper:]' '[:lower:]' |\
            sed "s/-/_/g;s/\//_/g;s/\.//g"\
    )
    DOCKER_NAME="$DOCKER_NAME:latest"
    echo $DOCKER_NAME
}


check_source_file() {
    if [ -f "$1" ];
    then
        . "$1";
    else
        echo "Error $1";
    fi
}

touch_x() {
    touch $1 \
        && sudo chmod u+x $1
}

mkdir_cd() {
    mkdir -p $1 \
        && cd $1
}


mkdir_if_not_exists() {
    ! [ -d $1 ] \
        && mkdir -p $1
}


touch_if_not_exists() {
    ! [ -f "$1" ] \
        && mkdir -p $(dirname $1) \
        && touch $1
}


add_path() {
    export PATH="$PATH:$1"
}


export_subfolder_rec() {

  PATH_LIST=$(find "$1" -type d -printf ':%p')

  add_path "${PATH_LIST:1}"
}


get_paths_file() {
    TLIST=$(cat $1 \
        | sed 's/^/echo \"/g; s/$/\"/g' | bash \
        | tr '\n' ':')
    TLIST="${TLIST::-1}"
}


set_path() {
    sed '\
        s/^/export PATH="$PATH:/; \
        s/$/"/;' \
    $HOME/.config/profile/path.txt
}


commit() {
    if [ $# -ge 1 ]
    then
        git status &&\
            git add . &&\
            git commit -m "$1" &&\
            git push --all origin
    else
        echo "ERROR"
    fi
}


add_todo() {
    echo "echo \"$@\"" >> ~/.config/profile/todos.txt
}


preview_file() {
    case $1 in
        *.zip)
            echo "do something about zip"
            ;;

        *)
            echo "NOT FOUND!"
            ;;
    esac
}

open_file() {
    case $1 in
        *.zip)
            echo "do something about zip"
            ;;

        *)
            echo "NOT FOUND!"
            ;;
    esac
}

extract_file() {
    case $1 in
        *.zip)
            echo "do something about zip"
            ;;

        *.tar.gz)
            echo "extracting tar gz"
            tar -xf $1
            ;;
    esac
}

mounting_file() {
    echo "mounting file"
}


save_dir() {
    export CURR_DIR=$(pwd)
}

go_saved_dir() {
    cd $CURR_DIR
}


source_ros_humble() {
    source /opt/ros/humble/setup.bash
}


update_nix() {
    vim ~/.config/.FILES/profile/.config/.nixos_cfg/configuration.nix

    sudo cp ~/.config/.FILES/profile/.config/.nixos_cfg/configuration.nix /etc/nixos/configuration.nix

    sudo nixos-rebuild switch
}
