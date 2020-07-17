if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
    SHELL_NAME="bash"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="MacOSX"
    SHELL_NAME="zsh"
fi

curl -o ${HOME}/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-${OS}-x86_64.sh
shasum -a 256 ${HOME}/miniconda.sh
CONDA_PATH="${HOME}/miniconda3"
bash ${HOME}/miniconda.sh -b -p ${CONDA_PATH}
rm ${HOME}/miniconda.sh
eval "$(${CONDA_PATH}/bin/conda shell.${SHELL_NAME} hook)"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    conda init
elif [[ "$OSTYPE" == "darwin"* ]]; then
    conda init zsh
fi
conda config --set auto_activate_base false
conda env create -f environment.yml
# pip list --format=freeze > conda_requirements.txt
