#!/bin/sh

[ $# -eq 1 ] && git status && git add . && git commit -m "$1" && git push || echo "ERROR"
