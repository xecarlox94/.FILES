PYTHON_PACKGS=(pandas jupyterlab sklearn isort pipenv nose pytest networkx jupyter_contrib_nbextensions pyspark tensorflow keras ipywidgets)


for PACKG in "${PYTHON_PACKGS[@]}";
do
    pip3 install "$PACKG"
done

jupyter labextension install @jupyter-widgets/jupyterlab-manager

jupyter contrib nbextension install --user
jupyter nbextension enable varInspector/main
