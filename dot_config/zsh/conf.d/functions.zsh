_bwu() {
  export BW_SESSION=$(bw unlock --raw) || return 1
}

_bwl() {
  bw list items --search "$1" | jq -r '.[].name'
}

_up() {
  brew update
  brew upgrade --greedy
  brew bundle --file=$BREWFILE
  mise upgrade
}

_gc() {
  brew bundle cleanup --force --file=$BREWFILE
  brew autoremove
  brew cleanup --prune=all
  mole clean
  mole purge
  mise prune
}

_status() {
  brew bundle cleanup --file=$BREWFILE
  chezmoi diff
}

_brewed() {
  brew bundle dump --force --file=$BREWFILE
  chezmoi add $BREWFILE
}
