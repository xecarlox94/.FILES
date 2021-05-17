PYTHON_PACKGS=(pandas jupyterlab sklearn isort pipenv nose pytest networkx)

for PACKG in "${PYTHON_PACKGS[@]}";
do
    pip3 install "$PACKG"
done

