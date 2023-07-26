#!/usr/bin/sh


cat utils.sh \
    | sed '/^#+$/d'
    #| sed '/^\s*$/d; /^[[:space:]]*.*/d;'
