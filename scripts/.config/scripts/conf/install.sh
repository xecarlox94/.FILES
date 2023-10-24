#!/bin/sh

echo "what is your git username?"
read GIT_USER_NAME

echo "what is your email?"
read GIT_USER_EMAIL

BACKUP_DIR=$HOME/.config/backup
mkdir -p $BACKUP_DIR


#mv $HOME/.bash_profile   $BACKUP_DIR
#mv $HOME/.bash_logout   $BACKUP_DIR


mv $HOME/.bashrc        $BACKUP_DIR
mv $HOME/.profile       $BACKUP_DIR


$HOME/.config/.FILES/scripts/.config/scripts/conf/stow.sh

echo "\
export GIT_AUTHOR_NAME=\"$GIT_USER_NAME\"\
export GIT_AUTHOR_EMAIL=\"$GIT_USER_EMAIL\"\
export GIT_COMMITTER_NAME=\"$GIT_USER_NAME\"\
export GIT_COMMITTER_EMAIL=\"$GIT_USER_EMAIL\"\
" >> $HOME/.config/tmp/env.sh
