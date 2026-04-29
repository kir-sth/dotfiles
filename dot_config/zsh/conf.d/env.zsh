# HOMEBREW
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_BAT=1

# MAS
export MAS_NO_AUTO_INDEX=1

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="${TMPDIR%/}"

# STYLE
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="base16"
export LANG=en_US.UTF-8
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ZSH
export ZSH_COMPDUMP="$XDG_CONFIG_HOME/zsh/zcompdump"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# TOOLS
export BREWFILE="$XDG_CONFIG_HOME/brew/Brewfile"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export SHELDON_CONFIG_DIR="$XDG_CONFIG_HOME/sheldon"
export SHELDON_DATA_DIR="$XDG_DATA_HOME/sheldon"
export SQLIT_CONFIG_DIR="$XDG_CONFIG_HOME/sqlit"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# PYTHON
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_DATA_DIR="$XDG_DATA_HOME/jupyter"

# PLUGINS
export ATUIN_NOBIND="true"
export YSU_MESSAGE_POSITION="after"
export YSU_MESSAGE_FORMAT="💡 alias: %alias"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=header:italic"
