up() {
  local -a tasks=(
    "brew update"
    "brew upgrade --greedy"
    "brew bundle"
    "mise upgrade"
  )
  core::run_tasks "${tasks[@]}"
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
  core::run_tasks "${tasks[@]}"
}

status() {
  local -a tasks=(
    "true | brew bundle cleanup"
    "chezmoi diff | delta --paging=never"
    "git -C $XDG_DATA_HOME/chezmoi -c core.pager=\"delta --paging=never\" diff"
  )
  core::run_tasks "${tasks[@]}"
}

lock() {
  local -a tasks=(
    "brew bundle dump --force"
    "chezmoi add \"$XDG_CONFIG_HOME/homebrew/Brewfile\""
    "chezmoi add \"$XDG_CONFIG_HOME/mise/mise.toml\""
  )
  core::run_tasks "${tasks[@]}"
}

setup() {
  [[ ! -o interactive || ! -t 0 ]] && return 1
  rbw unlocked &>/dev/null || rbw unlock || return 1

  local -a tasks=(
    "export::cloudflare"
    "export::github"
    "export::zai"
  )
  core::run_tasks "${tasks[@]}"
}

check() {
  local -a tasks=(
    "brew vulns"
    "bumblebee::sync"
    "bumblebee::scan"
  )
  core::run_tasks "${tasks[@]}"
}
