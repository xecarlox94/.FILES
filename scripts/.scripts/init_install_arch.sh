
APPS=(git vim neovim stow vifm g++ python3-pip zsh gparted apt-transport-https curl transmission)

sudo pacman -Syu

for APP in "${APPS[@]}";
do
	sudo pacman -Sy --noconfirm "$APP"
done

source ~/.FILES/scripts/.scripts/init_python.sh

source ~/.FILES/scripts/.scripts/stow.sh
