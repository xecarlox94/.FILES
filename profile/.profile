

export ZDOTDIR="$HOME/.config/zsh"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


PATHF=~/.config/profile/path
[ -f $PATHF ] && source $PATHF

ALIASES=~/.config/profile/aliases
[ -f $ALIASES ] && source $ALIASES

