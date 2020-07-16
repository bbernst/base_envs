if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS='Linux'
    SHELL_NAME='bash'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS='MacOSX'
    SHELL_NAME='zsh'
fi

curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-${OS}-x86_64.sh
# shasum -a 256 ~/miniconda.sh
CONDA_PATH="${HOME}/miniconda3"
bash ~/miniconda.sh -b -p ${CONDA_PATH}
eval "$(${CONDA_PATH}/bin/conda shell.${SHELL_NAME} hook)"
conda init
conda config --set auto_activate_base false
source "~/.${SHELL_NAME}rc"
conda env create -f environment.yml
# pip list --format=freeze > conda_requirements.txt
rm ~/miniconda.sh
