#!/bin/sh

UTILS=~/.config/profile/utils.sh && [ -f $UTILS ] && source $UTILS




[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


check_source_file ~/.config/profile/env.sh

check_source_file ~/.config/profile/utils.sh


check_source_file ~/.config/tmp_env.sh
