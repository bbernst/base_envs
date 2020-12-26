# Download and dragged into Applications
1. Chrome
    1. Bitwarden (extension)
1. SizeUp
1. KeepingYouAwake
1. VSCode
    1. Install code in PATH via installer
1. iTerm2
1. Spotify
1. Workflowy

# Command line
1. Get brew (https://brew.sh/)
1. Get ohmyzsh (https://ohmyz.sh/#install)
1. powerlevel10k (https://github.com/romkatv/powerlevel10k)
    1. Remember to set `ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc`
1. Add aliases to `~/.zshrc`
    1. `alias gpu='git push -u origin HEAD'`
    1. `alias gb='git --no-pager branch'`
    1. `alias jupnb='jupyter notebook'`
1. zsh-syntax-highlighting as last plugin (using oh my zsh install method not brew)
1. `brew install tmux`
    1. https://github.com/tmux-plugins/tpm
        1. Color fix with `set -g default-terminal "screen-256color"`
    1. https://github.com/tmux-plugins/tmux-resurrect
    1. https://github.com/tmux-plugins/tmux-continuum
        1. Follow instructions and remember `set -g @continuum-restore 'on'`
1. `git clone https://github.com/bbernst/base_envs.git`
    1. Python env with `./miniconda.sh`