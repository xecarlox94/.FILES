ALIASES=~/.config/profile/aliases
[ -f $ALIASES ] && source $ALIASES

set -o vi

export PS1='\e[1;36m\w \e[0m# '
