cd ~

rm .bash_profile .bash_logout .bashrc .profile

cd .config/

rm -rf vifm/

cd ~/.FILES/
stow --adopt -vRt ~ *

cd ~
