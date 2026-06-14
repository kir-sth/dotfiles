# CONFIGS
alias brewfile="bat -pp -l ruby $HOMEBREW_BUNDLE_FILE"
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
alias jq="jaq"
alias jnv="jnv --config $XDG_CONFIG_HOME/jnv/config.toml"

# GENERAL
alias up="_up"
alias gc="_gc"
alias status="_status"
alias lock="_lock"
alias check="_check"
alias setup="_setup"
alias y="_y"

# MISC
alias alert="osascript -e 'display notification \"Done!\" with title \"Terminal\" sound name \"Crystal\"'"
alias -g -- --help="--help 2>&1 | bat -l help -p"
