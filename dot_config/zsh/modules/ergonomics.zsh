# MODERN CLI TOOL REPLACEMENTS
alias vi="hx"
alias vim="hx"
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first --git"
alias tree="eza --tree -lah --icons --level=3 --git --git-ignore"
alias cat="bat -pp"
alias ps="procs"
alias du="dust -r"
alias jq="jaq"
alias jnv="jnv --config $XDG_CONFIG_HOME/jnv/config.toml"
alias freeze="freeze --config user"

# SHELL UX
alias alert="osascript -e 'display notification \"Done!\" with title \"Terminal\" sound name \"Crystal\"'"
alias -g -- --help="--help 2>&1 | bat -l help -p"
