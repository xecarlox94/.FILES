PYTHON_PACKGS=(pandas jupyterlab sklearn isort pipenv nose pytest)

for PACKG in "${PYTHON_PACKGS[@]}";
do
    pip3 install "$PACKG"
done

