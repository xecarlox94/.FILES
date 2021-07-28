
source ~/.FILES/scripts/.scripts/packages.sh

sudo apt update && sudo apt upgrade -y

APPS+=(apt-transport-https python3-pip software-properties-common ca-certificates)

sudo apt install -y "$APPS"

source ~/.FILES/scripts/.scripts/deb/install_brave.sh

source ~/.FILES/scripts/.scripts/deb/install_docker.sh
source ~/.FILES/scripts/.scripts/init_python.sh
source ~/.FILES/scripts/.scripts/init_nodejs.sh

source ~/.FILES/scripts/.scripts/stow.sh

source ~/.FILES/scripts/.scripts/config.sh
