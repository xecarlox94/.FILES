# FOR PROFILE FILES
# [[ -f ~/.bashrc ]] && . ~/.bashrc


[[ $- != *i* ]] && return


ENVF=~/.profile
[ -f $ENVF ] && source $ENVF

HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=1000

set -o vi

shopt -s histappend

export PS1="\[\e[32m\][\[\e[m\]\[\e[37m\]\h\[\e[m\] \[\e[37m\]:\[\e[m\] \[\e[33;40m\]\u\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[32m\]\\$\[\e[m\]  "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/xecarlox/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/xecarlox/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/xecarlox/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/xecarlox/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

