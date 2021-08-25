export PATH="$PATH:$HOME/.FILES/scripts/.config/scripts"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"


export ZDOTDIR="$HOME/.config/zsh"

export DOOMDIR="$HOME/.config/doom"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


export STARSHIP_CONFIG=~/.config/startship/config.toml
export STARSHIP_CACHE=~/.cache/startship/cache


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


if [[ $(fgconsole 2>/dev/null) == 1 ]];
then
    exec startx -- vt1
fi
