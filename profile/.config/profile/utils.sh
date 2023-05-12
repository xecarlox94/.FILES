#!/bin/env sh


check_source_file() {
  if [ -f "$1" ];
  then
    . "$1";
  fi
}
export -f check_source_file
