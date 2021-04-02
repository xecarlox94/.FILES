
PTHON_PACKGS=(pandas jupyterlab)

for PACKG in "${PYTHON_PACKGS[@]}";
do
	pip3 install "$PACKG"
done

source ./stow.sh
