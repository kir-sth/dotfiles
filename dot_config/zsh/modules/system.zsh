# DOTFILES SHORTCUTS
alias brewfile="bat -l ruby $HOMEBREW_BUNDLE_FILE"
alias misefiles="bat "$XDG_CONFIG_HOME"/mise/config.toml "$XDG_CONFIG_HOME"/mise/conf.d/*.toml"
alias configs="(cd $XDG_DATA_HOME && hx chezmoi) && chezmoi apply"

# TASK RUNNER
system::run_tasks() {
  local cmd selected

  selected=$(
    printf "%s\n" "$@" | gum choose --no-limit
  ) || return

  for cmd in ${(f)selected}; do
    gum style \
      --border normal \
      --border-foreground 240 \
      --padding "0 1" \
      --foreground 244 \
      "$cmd"
    eval "$cmd"
  done
}

# SYSTEM TASKS
up() {
  local -a tasks=(
    "brew update"
    "brew upgrade --greedy"
    "brew bundle"
    "mise upgrade"
  )
  system::run_tasks "${tasks[@]}"
}

gc() {
  local -a tasks=(
    "brew bundle cleanup --force"
    "brew autoremove"
    "brew cleanup --prune=all"
    "mole clean"
    "mole purge"
    "mise prune"
  )
  system::run_tasks "${tasks[@]}"
}

status() {
  local -a tasks=(
    "true | brew bundle cleanup"
    "chezmoi diff | delta --paging=never"
    "git -C $XDG_DATA_HOME/chezmoi -c core.pager=\"delta --paging=never\" diff"
  )
  system::run_tasks "${tasks[@]}"
}

lock() {
  local -a tasks=(
    "brew bundle dump --force"
    "chezmoi add \"$XDG_CONFIG_HOME/homebrew/Brewfile\""
    "chezmoi add \"$XDG_CONFIG_HOME/mise\""
  )
  system::run_tasks "${tasks[@]}"
}

check() {
  local -a tasks=(
    "brew vulns"
    "bumblebee::sync"
    "bumblebee::scan"
  )
  system::run_tasks "${tasks[@]}"
}
