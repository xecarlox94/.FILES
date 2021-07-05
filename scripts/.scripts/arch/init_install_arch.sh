source ~/.FILES/scripts/.scripts/packages.sh

sudo pacman -Syu

APPS+=(brave docker-compose docker qemu ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat qemu-arch-extra qtile xmonad i3-wm i3lock i3status dmenu)


for APP in "${APPS[@]}";
do
    sudo pacman -Sy --noconfirm --needed "$APP"
done

source ~/.FILES/scripts/.scripts/init_python.sh

source ~/.FILES/scripts/.scripts/init_nodejs.sh

source ~/.FILES/scripts/.scripts/arch/config_virtmanager.sh


source ~/.FILES/scripts/.scripts/stow.sh


source ~/.FILES/scripts/.scripts/config.sh

source ~/.FILES/scripts/.scripts/init_ssh_keys.sh
