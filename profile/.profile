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

