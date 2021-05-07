
source ~/.FILES/scripts/.scripts/packages.sh

sudo pacman -Syu

for APP in "${APPS[@]}";
do
	sudo pacman -Sy --noconfirm --needed "$APP"
done

source ~/.FILES/scripts/.scripts/init_python.sh

source ~/.FILES/scripts/.scripts/stow.sh
