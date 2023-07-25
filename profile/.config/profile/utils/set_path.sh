#!/bin/sh

sed \
        's/^/export PATH="$PATH:/' \
        $HOME/$1 \
    | sed 's/$/"/' \
    | bash
echo "running set_path"
