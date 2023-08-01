#!/bin/sh




EXT="${1#*.}"

#echo "${dirname $1}/${$1}"
echo "DIRNAME!"

case $EXT in
    "zip")
        #unzip $1
        ;;

    *)
        echo "NOT FOUND!"
        ;;
esac



