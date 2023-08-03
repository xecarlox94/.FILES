#!/bin/sh


source_util_fns() {
    UTILS=~/.config/profile/utils/utils.sh
    if [ -f $UTILS ];
    then
        set -a
        source $UTILS
        set +a
    fi
}
export -f source_util_fns


echo "sourcing util fns"
#source_util_fns a



 ["$(tty)" = "/dev/tty1" ] \
    && echo "RUNNING TTY" \
    || echo "ECHOOOOO"



check_source_file ~/.config/profile/env.sh

touch_if_not_exists $HISTFILE

touch_if_not_exists "$TMP_ENV/env.sh"

touch_if_not_exists "$TMP_ENV/aliases.sh"
touch_if_not_exists "$TMP_ENV/env.sh"
touch_if_not_exists "$TMP_ENV/path.sh"
touch_if_not_exists "$TMP_ENV/path.txt"
touch_if_not_exists "$TMP_ENV/sandbox.sh"
touch_if_not_exists "$TMP_ENV/vars.sh"

check_source_file "$TMP_ENV/env.sh"
mkdir_if_not_exists "$TMP_ENV/bin"
export_subfolder_rec "$TMP_ENV/bin"

