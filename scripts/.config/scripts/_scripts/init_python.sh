PYTHON_PACKGS=(pipenv pytest)

for package in ${PYTHON_PACKGS[@]}
do
    pip3 install $package
done
