#!/bin/sh

if [ $# -ge 1 ]
then
    git status                  && \
    git add .                   && \
    git commit -m "$1"          && \
    git push --all origin
else
    echo "ERROR"
fi
