#!/bin/sh

pip list | awk '{print $1}' | tail -n+3 | fzf --multi --preview 'pip show -v {1}' | xargs -ro pip uninstall -y



