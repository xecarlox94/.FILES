
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.emacs.d/bin"

export VIMINIT="source ~/.config/vim/vimrc"

[ -f ~/.bashrc ] && source ~/.bashrc

# eporting python executable files
export PATH=$PATH:$HOME/.local/bin

# working directories
export ZDOTDIR="$HOME/.config/zsh"


[ "$(tty)" = "/dev/tty1" ] && echo "RUNNING TTY" || echo "ECHOOOOO"
