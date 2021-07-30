export PATH="$PATH:$HOME/.FILES/scripts/.config/scripts"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.local/bin"


export DOOMDIR="$HOME/.config/doom"
export ZDOTDIR="$HOME/.config/zsh"
export XMONAD_CONFIG_DIR="$HOME/.config/xmonad"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


BASHRC=~/.bashrc
[ -f $BASHRC ] && source $BASHRC


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1
