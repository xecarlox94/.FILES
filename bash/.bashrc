#!/bin/sh

echo "add P2PRC env variable to profile"
export P2PRC=$HOME/Sources/p2p-rendering-computation

PROF=~/.profile \
    && [ -f $PROF ] \
    && source $PROF


[[ $- != *i* ]] && return

HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=1000

set -o vi

shopt -s histappend

export PS1="\[\e[32m\][\[\e[m\]\[\e[37m\]\h\[\e[m\] \[\e[37m\]:\[\e[m\] \[\e[33;40m\]\u\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[32m\]\\$\[\e[m\]  "


export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/python/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
export PATH="$PATH:$HOME/.config/tmp_env/bin"
export PATH="$PATH:$HOME/.config/.FILES/scripts/.config/scripts/_scripts"

export PATH="$PATH:$HOME/Sources/p2prc"

export P2PRC="$HOME/Sources/p2prc"


echo "add functionality to export functions with smart piping"
echo "set environment variables properly"
echo "fix bash history file issue"
echo "add script to verify tmp_env folder exists, plus creating its env files"
echo "adding script to create folder and cd into it"
echo "fix git commit script"
echo "move todos to a separate txt file"
echo "add script to initialise config on multiple distros"
echo "configure xmonad on ubuntu work"
echo "create shell script to check if program is installed"
echo "add script to search in the web from the terminal"
echo "fix path.txt location"
echo "add declarative export env variables paths"
echo "finish exporting functions, profile/.config/profile/working/"
echo "add funtion to add to path list env variable"
echo "add text file to list all paths folders to be added"
echo "fix set env script"
