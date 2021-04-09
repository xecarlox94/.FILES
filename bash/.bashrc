

# source bash aliases, if file exists
[[ -f ~/.aliases ]] && . ~/.aliases

PS1='[\u@\h \W]\$ '

HISTFILE=~/.cache/zsh/histfile

export PATH=$PATH:$HOME/.local/bin

#exec zsh
