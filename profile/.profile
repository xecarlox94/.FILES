export PATH="$PATH:$HOME/.FILES/scripts/.config/scripts"
export PATH="$PATH:$HOME/.local/bin"


export ZDOTDIR="$HOME/.config/zsh"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


ALIASES=~/.config/profile/aliases
[ -f $ALIASES ] && source $ALIASES

