#!/bin/sh




EXT="${1#*.}"


case $EXT in
    "zip")
        echo "do something about zip"
        ;;

    *)
        echo "NOT FOUND!"
        ;;
esac



