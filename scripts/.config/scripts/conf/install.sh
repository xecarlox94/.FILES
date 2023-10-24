#!/bin/sh

echo "what is your git username?"
read GIT_USER_NAME

echo "what is your email?"
read GIT_USER_EMAIL

echo "running!!!!"

BACKUP_DIR=$HOME/.config/backup


#mv $HOME/.bash_profile   $BACKUP_DIR
#mv $HOME/.bash_logout   $BACKUP_DIR

mkdir -p $BACKUP_DIR

mv_file() {
   if [ -f $1 ];
   then
       mv $1   $BACKUP_DIR
   fi
}


mv_file $HOME/.bashrc
mv_file $HOME/.bash_logout
mv_file $HOME/.bash_profile
mv_file $HOME/.profile


$HOME/.config/.FILES/scripts/.config/scripts/conf/stow.sh

printf "\
export GIT_AUTHOR_NAME=\"$GIT_USER_NAME\"\n\
export GIT_AUTHOR_EMAIL=\"$GIT_USER_EMAIL\"\n\
export GIT_COMMITTER_NAME=\"$GIT_USER_NAME\"\n\
export GIT_COMMITTER_EMAIL=\"$GIT_USER_EMAIL\"\n\
" >> $HOME/.config/tmp/env.sh
