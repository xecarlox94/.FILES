source ~/.FILES/scripts/.config/scripts/packages.sh

sudo pacman -Syu --no-confirm

APPS+=(docker docker-compose python-pip ripgrep fd shellcheck)

# desktop
APPS+=(brave webkit2gtk gcr zathura zathura-pdf-poppler texlive-most gstreamer gst-plugins-good gst-libav sxiv)

# virtual machine
APPS+=(qemu ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat qemu-arch-extra iptables-nft nftables)

sudo pacman -Sy --noconfirm --needed "$APPS"

source ~/.FILES/scripts/.config/scripts/init_python.sh
source ~/.FILES/scripts/.config/scripts/init_nodejs.sh

source ~/.FILES/scripts/.config/scripts/arch/config_virtmanager.sh

source ~/.FILES/scripts/.config/scripts/stow.sh
source ~/.FILES/scripts/.config/scripts/config.sh
