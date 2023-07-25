#!/bin/sh


UTILS=~/.config/profile/utils/utils.sh \
    && [ -f $UTILS ] \
    && source $UTILS


[ "$(tty)" = "/dev/tty1" ] \
    && echo "RUNNING TTY" \
    || echo "ECHOOOOO"


check_source_file ~/.config/profile/env.sh


check_source_file ~/.config/tmp_env/env.sh
