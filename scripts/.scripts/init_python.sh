
PTHON_PACKGS= (pandas jupyterlab jupyterlab_vim sklearn)


for PACKG in "${PYTHON_PACKGS[@]}";
do
	pip3 install "$PACKG"
done

