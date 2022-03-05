#!/bin/sh

alias gst="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"

alias commit="commit.sh"


alias sd="sudo shutdown now"
alias rb="reboot"

export VIMINIT='let $MYVIMRC = !has("nvim") ? "~/.config/vim/init.vim" : "~/.config/nvim/init.lua" | so $MYVIMRC'
