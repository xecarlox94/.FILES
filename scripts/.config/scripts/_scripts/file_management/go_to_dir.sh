#!/bin/sh

find -type d | fzf --preview "{ls $1}" | sed "s/\./${pwd}/"

#| xargs -ro echo
