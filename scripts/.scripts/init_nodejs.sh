NODE_PACKGS=(marked)

for PACKG in "${NODE_PACKGS[@]}";
do
    sudo npm install -g "$PACKG"
done

