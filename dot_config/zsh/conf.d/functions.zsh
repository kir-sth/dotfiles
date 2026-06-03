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

_y() {
	local tmp_file cwd
	tmp_file="$(mktemp -t "yazi-cwd.XXXXXX")"

	command yazi "$@" --cwd-file="$tmp_file"
	[[ -f "$tmp_file" ]] || return 1

	cwd=$(<"$tmp_file")
	command rm -f -- "$tmp_file"

	if [[ -n "$cwd" && "$cwd" != "$PWD" && -d "$cwd" ]]; then
		builtin cd -- "$cwd"
	fi
}
