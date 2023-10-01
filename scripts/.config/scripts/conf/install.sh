#!/bin/sh

BACKUP_DIR=$HOME/.config/backup


mkdir -p $BACKUP_DIR

mv $HOME/.bashrc    $BACKUP_DIR
mv $HOME/.profile   $BACKUP_DIR

mv $HOME/.bash*     $BACKUP_DIR

$HOME/.config/.FILES/scripts/.config/scripts/conf/stow.sh

bash


