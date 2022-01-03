PATHF=~/.config/profile/path
[ -f $PATHF ] && source $PATHF

ALIASES=~/.config/profile/aliases
[ -f $ALIASES ] && source $ALIASES

HISTSIZE=1000
HISTFILESIZE=1000

set -o vi

export PS1="\[\e[32m\][\[\e[m\]\[\e[37m\]\h\[\e[m\] \[\e[37m\]:\[\e[m\] \[\e[33;40m\]\u\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[32m\]\\$\[\e[m\]  "
