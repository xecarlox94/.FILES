#!/bin/sh



check_source_file $HOME/.config/profile/vars.sh

check_source_file $HOME/.config/profile/path.sh

check_source_file $HOME/.config/profile/aliases.sh




touch_if_not_exists $HISTFILE
touch_if_not_exists $XSERVERRC
mkdir_if_not_exists $XDG_DESKTOP_DIR
mkdir_if_not_exists $XDG_DOCUMENTS_DIR
mkdir_if_not_exists $XDG_DOWNLOAD_DIR
mkdir_if_not_exists $XDG_MUSIC_DIR
mkdir_if_not_exists $XDG_PICTURES_DIR
mkdir_if_not_exists $XDG_TEMPLATES_DIR
mkdir_if_not_exists $XDG_VIDEOS_DIR
mkdir_if_not_exists $XDG_PUBLICSHARE_DIR


mkdir_if_not_exists "$TMP_ENV/bin"
export_subfolder_rec "$TMP_ENV/bin"

touch_if_not_exists "$TMP_ENV/path.txt"

touch_if_not_exists "$TMP_ENV/env.sh"
check_source_file "$TMP_ENV/env.sh"

