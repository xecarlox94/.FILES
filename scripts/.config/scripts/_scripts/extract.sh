#!/bin/sh




EXT="${1#*.}"

echo $1

BASENAME=$(basename $1)
FNAME="${BASENAME%%.*}"
FNAME_1ST="${BASENAME%.*}"
echo "FILE NAME!"

echo $(dirname $1)
echo "DIRNAME!"

case $EXT in
    "zip")
        #unzip $1
        ;;

    *)
        echo "NOT FOUND!"
        ;;
esac



