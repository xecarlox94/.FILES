
APPS=(git vim neovim stow vifm g++ python3-pip zsh)

source ./updt_upgr.sh

for APP in "${APPS[@]}";
do
	sudo apt install -y "$APP"
done


PYTHON_PACKGS=(pandas jupyterlab)

for PACKG in "${PYTHON_PACKGS[@]}";
do
	pip3 install "$PACKG"
done

source ./stow.sh
