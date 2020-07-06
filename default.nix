# nix-channel --update nixpkgs
# nix-shell default.nix
# ^^ alias nixpy38='nix-shell $HOME/Development/base_envs/default.nix'

with import <nixpkgs> {};
with stdenv.lib;
with python38Packages;

stdenv.mkDerivation rec {
  name = "py38";
  req_location = "requirements.txt";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python38
    virtualenv
    virtualenvwrapper
    pip
  ];

  LD_LIBRARY_PATH = "${makeLibraryPath [ stdenv.cc.cc.lib ]}";

  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)

    # ENV_HOME
    export ENV_HOME="$HOME/Development/base_envs"
    export PYTHONPATH="$PYTHONPATH:$ENV_HOME"

    # use virtualenvwrapper to manage envs
    export WORKON_HOME="$ENV_HOME/Envs"
    mkdir -p $WORKON_HOME
    source $(command -v virtualenvwrapper.sh)

    # install
    mkvirtualenv ${name}
    workon ${name}
    python3 -m pip install -r "$ENV_HOME/${req_location}"
    python $ENV_HOME/jupyter_rename.py --name=${name}

    # prompt that says the derivation
    PS1="\[\033[1;34m\][nix-shell-${name}:\w]\n\$ \[\033[0m\]"
  '';
}
