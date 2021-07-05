PYTHON_PACKGS=(pandas jupyterlab sklearn matplotlib isort pipenv nose pytest networkx)


for PACKG in "${PYTHON_PACKGS[@]}";
do
    pip3 install "$PACKG"
done
