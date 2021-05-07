
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.emacs.d/bin"

export VIMINIT="source ~/.config/vim/vimrc"

export SPACEVIMDIR="$HOME/.config/spacevim"
export DOOMDIR="$HOME/.config/doom"

[ -f ~/.bashrc ] && source ~/.bashrc

export PATH=$PATH:$HOME/.local/bin

export ZDOTDIR="$HOME/.config/zsh"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"
