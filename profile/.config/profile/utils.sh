#!/bin/env sh

echo "utils.sh"
echo "fix shell handler"

check_source_file() {
    echo "executing check_source_file on: $1"
    if [ -f "$1" ];
    then
        . "$1";
    else
        echo "Error $1";
    fi
}
export -f check_source_file


