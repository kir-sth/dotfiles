# SHELDON
eval "$(sheldon source)"

# COMPLETIONS SETTINGS
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"

# COMPLETIONS INIT
autoload -Uz compinit
if [[ -n "$ZSH_COMPDUMP"(#qN.mh+24) ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

[[ ! -f "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc" ]] &&
  zcompile "$ZSH_COMPDUMP"
