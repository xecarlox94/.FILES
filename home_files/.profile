export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH=$PATH:$HOME/.local/bin


export SPACEVIMDIR="$HOME/.config/spacevim"
export DOOMDIR="$HOME/.config/doom"
export ZDOTDIR="$HOME/.config/zsh"


export LESSHISTFILE="$HOME/.cache/less/lesshst"
export HISTFILE="$HOME/.cache/terminal_history"


export VIMINIT="source ~/.config/vim/vimrc"


[ -f ~/.bashrc ] && source ~/.bashrc


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"


[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1
