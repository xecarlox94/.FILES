
source ~/.scripts/updt_upgr.sh

sudo apt install -y virt-manager

sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

sudo reboot
