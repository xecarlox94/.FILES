ENVF=~/.config/profile/env.sh
[ -f $ENVF ] && source $ENVF



HISTSIZE=1000
HISTFILESIZE=1000

set -o vi

export PS1="\[\e[32m\][\[\e[m\]\[\e[37m\]\h\[\e[m\] \[\e[37m\]:\[\e[m\] \[\e[33;40m\]\u\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[32m\]\\$\[\e[m\]  "
