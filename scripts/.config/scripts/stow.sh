cd ~

rm .bash_profile .bash_logout .bashrc .profile

cd ~/.FILES/
stow --adopt -Rt ~ *

cd ~
