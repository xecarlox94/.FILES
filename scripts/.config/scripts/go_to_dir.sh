#!/bin/sh

find -type d | fzf --preview "{ls $1}" | sed "s/\./\~/" | xargs -ro echo
