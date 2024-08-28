export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
#export XDG_RUNTIME_DIR="$XDG_CACHE_HOME/runtime"

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_PUBLICSHARE_DIR="$HOME/Public"

export XCOMPOSEFILE="$XDG_CONFIG_HOME/X11/xcompose"
export XCOMPOSECACHE="$XDG_CACHE_HOME/X11/xcompose"

# https://www.daniloaz.com/en/how-to-prevent-the-xsession-errors-file-from-growing-to-huge-size/
export ERRFILE=/dev/null


export NIX_STATE_HOME_DIR="$XDG_STATE_HOME/nix"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export LESSHISTFILE="$XDG_CACHE_HOME/less/lesshst"
export HISTFILE="$XDG_STATE_HOME/bash/history"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export DOOMDIR="$XDG_CONFIG_HOME/doom"

export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"


export NPM_CONFIG_PREFIX="${XDG_DATA_HOME}/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

export STACK_XDG=1
export STACK_ROOT="$XDG_DATA_HOME/stack"

export XMONAD_CONFIG_HOME="$XDG_CONFIG_HOME/xmonad"
export XMONAD_DATA_HOME="$XDG_DATA_HOME/xmonad"
export XMONAD_CACHE_HOME="$XDG_CACHE_HOME/xmonad"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export HISTFILE="$XDG_STATE_HOME/bash/history"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export CONDARC="$XDG_CONFIG_HOME/conda/condarc"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

export DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}"

export VIMINIT='let $MYVIMRC = !has("nvim") ? "~/.config/vim/init.vim" : "~/.config/nvim/init.lua" | so $MYVIMRC'

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

#export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
#export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
#export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"


export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CACHE_HOME/X11/xserverrc"


export XCOMPOSEFILE="$XDG_CONFIG_HOME/X11/xcompose"
export XCOMPOSECACHE="$XDG_CACHE_HOME/X11/xcompose"

export KERAS_HOME="$XDG_CONFIG_HOME/keras"

export MAIL="thunderbird"
#export WINDOW_MANAGER="xmonad"
#export BROWSER="something"
export EDITOR="vim"
#export TERM="alacritty"
export PAGER="less"


export PROFILE_ENV="$XDG_CONFIG_HOME/profile"
export TMP_ENV="$XDG_CONFIG_HOME/tmp"



alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

