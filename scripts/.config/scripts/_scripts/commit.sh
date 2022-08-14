#!/bin/sh

if [ $# -ge 1 ]
then
    git status
    git add .
    shift
    git commit -m "$@"
    git push --all origin
else
    echo "ERROR"
fi
