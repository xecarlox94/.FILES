#!/bin/sh

# shellcheck disable=SC1090


check_source_file() {
  if [ -f "$1" ];
  then
    . "$1";
  fi
}

check_source_file ~/.config/profile/path.sh

check_source_file ~/.config/profile/aliases.sh

check_source_file ~/.config/profile/vars.sh
