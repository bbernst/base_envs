# base_envs

## Repo
* Most of the `.gitignore` is github Python defaults
    * virtualenv home is `Envs/` in the folder so ignored
    * `.vscode/` ignored as well

## Miniconda install

0. Run miniconda.sh
0. Helpful commands
    * `pip list --format=freeze > requirements_conda.txt`
    * `conda env export --no-builds | grep -v "^prefix: " > environment_versioned.yml`
        * In case of `InvalidVersionSpec: Invalid version 'ERROR_HERE': invalid character(s)` do `grep -nr 'ERROR_HERE' ~/miniconda/envs` and fix it there or uninstall the package


## Python environments using nix and virtualenv(wrapper)
0. Nix install at https://nixos.org/download.html
0. Setup assumes `$HOME/Development` path exists
    * If being used in a project repo then can use `$PWD` since would be called from the same PATH
0. jupyter_rename.py adds the env name to the jupyter display name
