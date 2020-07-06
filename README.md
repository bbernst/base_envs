# base_envs

## Python environments using nix and virtualenv(wrapper)
* Nix install at https://nixos.org/download.html
* requirements.txt are personal preference
* Setup assumes `$HOME/Development` path exists
    * If being used in a project repo then can use `$PWD` since would be called from the same PATH
    * Also, wouldn't need an alias most likely
* jupyter_rename.py adds the env name to the jupyter display name
* Most of the `.gitignore` is github Python defaults
    * virtualenv home is `Envs/` in the folder so ignored
    * `.vscode/` ignored as well
