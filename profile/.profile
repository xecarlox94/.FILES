[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"



ENVF=~/.config/profile/env.sh
[ -f $ENVF ] && source $ENVF
