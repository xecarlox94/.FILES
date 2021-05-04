
PTHON_PACKGS=(pandas jupyterlab jupyterlab_vim sklearn)

# isort pipenv nosetests pytest

for PACKG in "${PYTHON_PACKGS[@]}";
do
	echo "pip"
	pip3 install "$PACKG"
done

