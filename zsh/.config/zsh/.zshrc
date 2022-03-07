HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000


ENVF=~/.config/profile/env.sh
[ -f $ENVF ] && source $ENVF




bindkey -v



export PS1="%n@%m $ "
