#!/bin/sh

[ $# -eq 0 ] && exit 1

curr_branch=$(git branch | grep '\*' | sed 's/* //')



$HOME/.FILES/scripts/.config/scripts/_scripts/commit.sh $1 && \
    git checkout master && \
    git pull && \
    git merge $1 && \
    git push && \
    git checkout $curr_branch
