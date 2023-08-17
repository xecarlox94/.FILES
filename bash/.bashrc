#!/bin/sh


PROF=~/.profile \
    && [ -f $PROF ] \
    && source $PROF


[[ $- != *i* ]] && return


HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=1000

shopt -s histappend

set -o vi
set editing-mode vi
set keymap vi

set show-all-if-ambiguous on
set mark-symlinked-directories on
set colored-stats on


export PS1="\[\e[32m\][\[\e[m\]\[\e[37m\]\h\[\e[m\] \[\e[37m\]:\[\e[m\] \[\e[33;40m\]\u\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[32m\]\\$\[\e[m\]  "


cat ~/.config/profile/todos.txt
