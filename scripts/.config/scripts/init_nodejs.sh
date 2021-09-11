NODE_PACKGS=(marked pyright)

for package in ${NODE_PACKGS[@]}
do
    sudo npm install -g package
done
