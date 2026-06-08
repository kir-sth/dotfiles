# XDG BASE
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="${TMPDIR%/}"

# XDG CONFIGS
export CRUSH_GLOBAL_CONFIG="$XDG_CONFIG_HOME/crush"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export SHELDON_CONFIG_DIR="$XDG_CONFIG_HOME/sheldon"
export SQLIT_CONFIG_DIR="$XDG_CONFIG_HOME/sqlit"

# XDG DATA
export IPYTHONDIR="$XDG_DATA_HOME/ipython"
export JUPYTER_DATA_DIR="$XDG_DATA_HOME/jupyter"
export BUN_INSTALL="$XDG_DATA_HOME/mise/bun"
export CARGO_HOME="$XDG_DATA_HOME/mise/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/mise/rustup"
export SHELDON_DATA_DIR="$XDG_DATA_HOME/sheldon"

# XDG STATE
export FZF_HISTORY_FILE="$XDG_STATE_HOME/fzf/history"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# XDG CACHE
export BUN_INSTALL_CACHE_DIR="$XDG_CACHE_HOME/mise/bun"
export UV_CACHE_DIR="$XDG_CACHE_HOME/mise/uv"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# HOMEBREW
export HOMEBREW_BAT=1
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_REQUIRE_TAP_TRUST=1

# MAS
export MAS_NO_AUTO_INDEX=1

# EDITOR
export EDITOR="nvim"
export VISUAL="nvim"
export LANG=en_US.UTF-8

# PAGER
export PAGER="moor"
export MANPAGER="moor"
export MOOR="--statusbar=bold --follow"

# BAT
export BAT_PAGER="moor"
export BAT_THEME="Monokai Extended"
export BAT_STYLE="numbers,changes,header"
export BAT_PAGING="never"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_OPTS="--preview '[ -f {} ] && bat --color=always --style=plain --paging=never {}'"
export FZF_DEFAULT_OPTS="
--height=40%
--layout=reverse
--border=rounded
--info=inline
--history=$FZF_HISTORY_FILE
--preview-window=right:60%:wrap
"

# ZSH PLUGINS
export ATUIN_NOBIND="true"
export YSU_MESSAGE_POSITION="after"
export YSU_MESSAGE_FORMAT="💡 alias: %alias"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
