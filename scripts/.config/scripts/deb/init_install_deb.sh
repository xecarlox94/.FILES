source ~/.FILES/scripts/.config/scripts/packages.sh

sudo apt update && sudo apt upgrade -y

APPS+=(apt-transport-https python3-pip software-properties-common ca-certificates)

for app in ${APPS[@]}
do
    sudo apt install -y $app
done


source ~/.FILES/scripts/.config/scripts/init_python.sh
source ~/.FILES/scripts/.config/scripts/init_nodejs.sh


source ~/.FILES/scripts/.config/scripts/deb/install_docker.sh


source ~/.FILES/scripts/.config/scripts/stow.sh
