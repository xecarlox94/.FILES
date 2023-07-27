#!/bin/sh

sed 's/^/export PATH="$PATH:/; s/$/"/;' $HOME/.config/profile/path.txt
