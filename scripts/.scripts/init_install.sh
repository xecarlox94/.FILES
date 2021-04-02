
APPS=(git vim neovim stow vifm g++ python3-pip zsh)

source ./updt_upgr.sh

for APP in "${APPS[@]}";
do
	sudo apt install -y "$APP"
done

source ./python.sh
