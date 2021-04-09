# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source bash aliases, if file exists
[[ -f ~/.aliases ]] && . ~/.aliases

PS1='[\u@\h \W]\$ '

exec zsh
