#!/bin/env sh

check_source_file() {
    if [ -f "$1" ];
    then
        . "$1";
    else
        echo "Error $1";
    fi
}


set_path() {
    sed \
            's/^/export PATH="$PATH:/' \
            $1 \
        | sed 's/$/"/' \
        | bash
}

touch_x() {
    touch $1 \
        && sudo chmod +x $1
}

mkdir_cd() {
    mkdir -p $1 \
        && cd $1
}
# export -f mkdir_cd
