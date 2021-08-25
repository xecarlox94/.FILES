HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000


ALIASES=~/.config/profile/aliases
[ -f $ALIASES ] && source $ALIASES


bindkey -v



eval "$(starship init zsh)"
