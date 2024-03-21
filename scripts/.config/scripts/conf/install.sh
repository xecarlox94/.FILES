#!/bin/sh

rm $HOME/.bashrc
rm $HOME/.bash_logout
rm $HOME/.bash_profile
rm $HOME/.profile


$HOME/.config/.FILES/scripts/.config/scripts/conf/stow.sh


if [ ! -d $HOME/.config/tmp/ ];
then

    echo "what is your git username?"
    read GIT_USER_NAME

    echo "what is your email?"
    read GIT_USER_EMAIL

	mkdir -p $HOME/.config/tmp/
	touch $HOME/.config/tmp/env.sh

    printf "\
    export GIT_AUTHOR_NAME=\"$GIT_USER_NAME\"\n\
    export GIT_AUTHOR_EMAIL=\"$GIT_USER_EMAIL\"\n\
    export GIT_COMMITTER_NAME=\"$GIT_USER_NAME\"\n\
    export GIT_COMMITTER_EMAIL=\"$GIT_USER_EMAIL\"\n\
    " >> $HOME/.config/tmp/env.sh

fi

