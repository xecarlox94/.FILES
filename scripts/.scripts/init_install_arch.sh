
APPS=(git vim neovim stow vifm g++ python3-pip zsh gparted apt-transport-https curl transmission)

source ~/.FILES/scripts/.scripts/updt_upgr_arch.sh

for APP in "${APPS[@]}";
do
	sudo pacman -Sy "$APP"
done

source ~/.FILES/scripts/.scripts/init_python.sh

source ~/.FILES/scripts/.scripts/stow.sh
