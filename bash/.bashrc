ALIASES=~/.config/profile/aliases
[ -f $ALIASES ] && source $ALIASES


set -o vi

export PS1='\e[1;36m\w \e[0m# '


CONDA_INIT=~/.conda_init

[ -f CONDA_INIT] && . CONDA_INIT
