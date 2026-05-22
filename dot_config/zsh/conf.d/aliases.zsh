# CONFIGS
alias brewfile="bat -pp -l ruby $BREWFILE"
alias misefile="bat -pp $XDG_CONFIG_HOME/mise/mise.toml"
alias configs="(cd $XDG_DATA_HOME && nvim chezmoi) && chezmoi apply"

# MODERN CLI
alias vim="nvim"
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first --git"
alias tree="eza --tree -lah --icons --level=3 --git --git-ignore"
alias cat="bat -pp"
alias ps="procs"
alias du="dust -r"

# GENERAL
alias up="_up"
alias gc="_gc"
alias status="_status"
alias brewed="_brewed"

# BITWARDEN
alias bwu="_bwu && _bw_load_secrets"
alias bwg="bw get password"
alias bwl="_bwl"

# MISC
alias alert="osascript -e 'display notification \"Done!\" with title \"Terminal\" sound name \"Crystal\"'"
alias -g -- --help="--help 2>&1 | bat -l help -p"
