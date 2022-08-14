export ZDOTDIR="$HOME/.config/zsh"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


ENVF=~/.config/profile/env.sh
[ -f $ENVF ] && source $ENVF


TMP_PROFILE=~/.config/tmp/tmp_profile.sh
[ -f $TMP_PROFILE ] && source $TMP_PROFILE
