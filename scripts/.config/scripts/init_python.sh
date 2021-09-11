PYTHON_PACKGS=(pandas jupyterlab sklearn matplotlib isort pipenv nose pytest networkx)

for package in ${PYTHON_PACKGS[@]}
do
    pip3 install $package
done
