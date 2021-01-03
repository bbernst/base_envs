# nix-channel --update nixpkgs
# ^^ Update nixpkgs occasionally

let
  # https://nixos.wiki/wiki/FAQ/Pinning_Nixpkgs
  # pkgs = import <nixpkgs> {};
  pkgs = import (builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixpkgs-2021-01-03";
    # Find the current commit hash with:
    # `curl "https://releases.nixos.org/nixpkgs/nixpkgs-$(nix-instantiate --eval -E '(import <nixpkgs> {}).lib.version' | tr -d '"')/git-revision" && echo`
    url = "https://github.com/nixos/nixpkgs/archive/2080afd039999a58d60596d04cefb32ef5fcc2a2.tar.gz";
    # Hash obtained using: `nix-prefetch-url --unpack <url>`
    sha256 = "0i677swvj8fxfwg3jibd0xl33rn0rq0adnniim8jnp384whnh8ry";
  }) {};

  pyInputs = with pkgs.python38Packages; [
    pkgs.python38
    virtualenv
    virtualenvwrapper
    pip
  ];

in pkgs.stdenv.mkDerivation rec {
  name = "py38";
  env_home = "Development";
  repo = "base_envs";
  req_location = "requirements_versioned.txt";

  buildInputs = pyInputs;

  LD_LIBRARY_PATH = "${pkgs.stdenv.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}";

  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)

    # ENV_HOME
    export ENV_HOME="$HOME/${env_home}/${repo}"
    export PYTHONPATH="$PYTHONPATH:$ENV_HOME"

    # use virtualenvwrapper to manage envs
    export WORKON_HOME="$ENV_HOME/Envs"
    mkdir -p $WORKON_HOME
    source $(command -v virtualenvwrapper.sh)

    # install
    mkvirtualenv ${name}
    workon ${name}
    python3 -m pip install -r "$ENV_HOME/${req_location}"

    # optional
    python $ENV_HOME/jupyter_rename.py --repo=${repo} --name=${name}
    python $ENV_HOME/requirements_versioned.py --repo=${repo}
    pip list --format=freeze > requirements_versioned_full.txt

    # prompt that says the derivation
    PS1="\[\033[1;34m\][nix-shell-${name}:\w]\n\$ \[\033[0m\]"
  '';
}
