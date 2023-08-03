#!/bin/env sh

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
        && sudo chmod +x $1
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
