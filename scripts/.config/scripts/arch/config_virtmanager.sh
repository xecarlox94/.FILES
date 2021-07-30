sudo systemctl enable libvirtd.service

sudo systemctl start libvirtd.service


sudo virsh net-define ~/.FILES/scripts/.scripts/arch/resources/br10.xml

sudo virsh net-start br10

sudo virsh net-autostart br10

sudo virsh net-start default
sudo virsh net-autostart default
