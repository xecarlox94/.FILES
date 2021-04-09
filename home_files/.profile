#!/bin/sh

export PATH="$PATH:$HOME/.scripts"
export VIMINIT="source ~/.config/vim/vimrc"


[ -f ~/.bashrc ] && source ~/bashrc


# working directories
export ZDOTDIR="$HOME/.config/zsh"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"
