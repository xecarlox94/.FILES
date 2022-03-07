

export ZDOTDIR="$HOME/.config/zsh"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"



ENVF=~/.config/profile/env.sh
[ -f $ENVF ] && source $ENVF
