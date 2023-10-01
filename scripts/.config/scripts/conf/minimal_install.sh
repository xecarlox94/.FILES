#!/bin/sh


echo "
set -a
source $HOME/.config/.FILES/profile/.config/profile/utils/utils.sh
set +a
export_subfolder_rec $HOME/.config/.FILES/scripts/.config/scripts/
"\
    >> $HOME/.bashrc


bash
