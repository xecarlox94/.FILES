sudo apt install -y virt-manager
sudo pacman -S virt-manager

sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

sudo reboot
