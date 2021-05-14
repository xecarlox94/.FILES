cd ~

rm .bash_profile .bash_logout .bashrc

cd ~/.FILES/
stow --adopt -vRt ~ *
