#!/bin/sh


UTILS=~/.config/profile/utils/utils.sh \
    && [ -f $UTILS ] \
    && source $UTILS


[ "$(tty)" = "/dev/tty1" ] \
    && echo "RUNNING TTY" \
    || echo "ECHOOOOO"



touch_if_not_exists $HISTFILE

touch_if_not_exists "$TMP_ENV/env.sh"

touch_if_not_exists "$TMP_ENV/aliases.sh"
touch_if_not_exists "$TMP_ENV/env.sh"
touch_if_not_exists "$TMP_ENV/path.sh"
touch_if_not_exists "$TMP_ENV/path.txt"
touch_if_not_exists "$TMP_ENV/sandbox.sh"
touch_if_not_exists "$TMP_ENV/vars.sh"

mkdir_if_not_exists "$TMP_ENV/bin"
export_subfolder_rec "$TMP_ENV/bin"

check_source_file "$TMP_ENV/env.sh"


check_source_file ~/.config/profile/env.sh
