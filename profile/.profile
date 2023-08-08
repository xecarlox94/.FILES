#!/bin/sh

exp_utils() {
    UTILS=$1
    if [ -f $UTILS ];
    then
        set -a
        source $UTILS
        set +a
    fi
}
export -f exp_utils
exp_utils $HOME/.config/profile/utils/utils.sh

check_source_file ~/.config/profile/env.sh

