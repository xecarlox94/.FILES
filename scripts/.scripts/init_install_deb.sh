
APPS=(git vim neovim stow vifm g++ python3-pip zsh gparted apt-transport-https curl transmission)

source ~/.scripts/updt_upgr.sh

for APP in "${APPS[@]}";
do
	sudo apt install -y "$APP"
done

source ~/.scripts/init_python.sh

source ~/.scripts/stow.sh
