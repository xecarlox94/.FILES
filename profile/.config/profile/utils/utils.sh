#!/bin/env sh

check_source_file() {
    if [ -f "$1" ];
    then
        . "$1";
    else
        echo "Error $1";
    fi
}
export -f check_source_file

touch_x() {
    touch $1 \
        && sudo chmod +x $1
}
export -f touch_x

mkdir_cd() {
    mkdir -p $1 \
        && cd $1
}
export -f mkdir_cd


mkdir_if_not_exists() {
    ! [ -d $1 ] \
        && mkdir -p $1
}
export -f mkdir_if_not_exists


touch_if_not_exists() {
    ! [ -f "$1" ] \
        && mkdir -p $(dirname $1) \
        && touch $1
}
export -f touch_if_not_exists


add_path() {
    echo $1
    export PATH="$PATH:$1"
}
export -f add_path


export_subfolder_rec() {

  PATH_LIST=$(find "$1" -type d -printf ':%p')

  add_path "${PATH_LIST:1}"
}
export -f export_subfolder_rec


get_paths_file() {
    TLIST=$(cat $1 \
        | sed 's/^/echo \"/g; s/$/\"/g' | bash \
        | tr '\n' ':')
    TLIST="${TLIST::-1}"
    echo $TLIST
}
export -f get_paths_file
