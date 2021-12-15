#!/bin/sh

pip list | awk '{print $1}' | fzf --multi --preview 'pip show -v {1}' | xargs -ro pip uninstall -y



