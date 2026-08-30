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
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"

# XDG DATA
export IPYTHONDIR="$XDG_DATA_HOME/ipython"
export JUPYTER_DATA_DIR="$XDG_DATA_HOME/jupyter"
export BUN_INSTALL="$XDG_DATA_HOME/mise/bun"
export CARGO_HOME="$XDG_DATA_HOME/mise/cargo"
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
export RUSTUP_HOME="$XDG_DATA_HOME/mise/rustup"
export SHELDON_DATA_DIR="$XDG_DATA_HOME/sheldon"

# XDG STATE
export FZF_HISTORY_FILE="$XDG_STATE_HOME/fzf/history"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"

# XDG CACHE
export BUN_INSTALL_CACHE_DIR="$XDG_CACHE_HOME/mise/bun"
export GOCACHE="$XDG_CACHE_HOME/go/build"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export SCCACHE_DIR="$XDG_CACHE_HOME/mise/sccache"
export UV_CACHE_DIR="$XDG_CACHE_HOME/mise/uv"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# EDITOR
export EDITOR="hx"
export VISUAL="hx"
export LANG=en_US.UTF-8

# PAGER
export PAGER="moor"
export MANPAGER="moor"
export MOOR="--statusbar=bold --follow"

# BAT
export BAT_PAGER="moor"
export BAT_THEME="tokyonight_storm"
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

# MISC
export MAS_NO_AUTO_INDEX=1
export MOLE_ENABLE_DISK_VERIFY=1
