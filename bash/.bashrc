ENVF=~/.config/profile/env.sh
[ -f $ENVF ] && source $ENVF



HISTSIZE=1000
HISTFILESIZE=1000

set -o vi

PS1="[ \[\e[37m\]\h\[\e[m\]@\u ] \\$ "
