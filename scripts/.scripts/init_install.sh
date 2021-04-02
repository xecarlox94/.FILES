
APPS=(git vim neovim stow vifm)

sudo apt update
sudo apt upgrade -y

for APP in "${APPS[@]}";
do
	sudo apt install -y "$APP"
done

cd ~/.FILES/
stow --adopt -vRt ~ *
