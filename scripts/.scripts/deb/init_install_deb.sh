
source ~/.FILES/scripts/.scripts/packages.sh

sudo apt update && sudo apt upgrade -y

for APP in "${APPS[@]}";
do
	sudo apt install -y "$APP"
done

source ~/.FILES/scripts/.scripts/init_python.sh

source ~/.FILES/scripts/.scripts/stow.sh
