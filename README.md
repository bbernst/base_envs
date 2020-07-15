# base_envs

## Repo
* Most of the `.gitignore` is github Python defaults
    * virtualenv home is `Envs/` in the folder so ignored
    * `.vscode/` ignored as well

## Miniconda install

0. curl -o ~/Downloads/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
0. shasum -a 256 ~/Downloads/miniconda.sh
0. bash ~/Downloads/miniconda.sh
0. conda config --set auto_activate_base false
0. source ~/.zrsh
0. conda env create -f environment.yml

## Python environments using nix and virtualenv(wrapper)
0. Nix install at https://nixos.org/download.html
0. Setup assumes `$HOME/Development` path exists
    * If being used in a project repo then can use `$PWD` since would be called from the same PATH
0. jupyter_rename.py adds the env name to the jupyter display name
