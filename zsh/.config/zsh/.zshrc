



HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000


bindkey -v


zstyle :compinstall filename '/home/xecarlox94/.config/zsh/.zshrc'


autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
