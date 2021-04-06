
PTHON_PACKGS=(pandas jupyterlab jupyterlab_vim sklearn)

source ~/.scripts/updt_upgr.sh

for PACKG in "${PYTHON_PACKGS[@]}";
do
	pip3 install "$PACKG"
done

