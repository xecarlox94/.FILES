#!/bin/sh


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


check_source_file() {
  if [ -f "$1" ];
  then
    . "$1";
  fi
}


check_source_file ~/.config/profile/env.sh


check_source_file ~/.config/tmp/tmp_profile.sh
