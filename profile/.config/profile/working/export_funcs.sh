#!/bin/sh


cat utils.sh \
    | sed '/^#+$/p'
    #| sed '/^\s*$/d; /^[[:space:]]*.*/d;'
