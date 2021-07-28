source ~/.FILES/scripts/.scripts/packages.sh

sudo pacman -Syu

APPS+=(docker docker-compose python-pip ripgrep fd shellcheck)

APPS+=(brave xmonad xmonad-contrib xmobar zathura zathura-pdf-poppler dmenu texlive-most)

APPS+=(qemu ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat qemu-arch-extra iptables-nft nftables)

sudo pacman -Sy --noconfirm --needed "$APPS"

source ~/.FILES/scripts/.scripts/init_python.sh
source ~/.FILES/scripts/.scripts/init_nodejs.sh

source ~/.FILES/scripts/.scripts/arch/config_virtmanager.sh

source ~/.FILES/scripts/.scripts/stow.sh

source ~/.FILES/scripts/.scripts/config.sh
