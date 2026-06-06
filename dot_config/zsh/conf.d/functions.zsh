_step() {
  gum style \
    --border normal \
    --border-foreground 240 \
    --padding "0 1" \
    --foreground 244 \
    "\$ $1"
}

_run_tasks() {
  local cmd selected

  selected=$(
    printf "%s\n" "$@" | gum choose --no-limit
  ) || return

  for cmd in ${(f)selected}; do
    _step "$cmd"
    eval "$cmd"
  done
}

_up() {
  local -a tasks=(
    "brew update"
    "brew upgrade --greedy"
    "brew bundle"
    "mise upgrade"
  )
  _run_tasks "${tasks[@]}"
}

_gc() {
  local -a tasks=(
    "brew bundle cleanup --force"
    "brew autoremove"
    "brew cleanup --prune=all"
    "mole clean"
    "mole purge"
    "mise prune"
  )
  _run_tasks "${tasks[@]}"
}

_status() {
  local -a tasks=(
    "true | brew bundle cleanup"
    "chezmoi diff | delta --paging=never"
  )
  _run_tasks "${tasks[@]}"
}

_brewed() {
  local -a tasks=(
    "brew bundle dump --force"
    "chezmoi add \"$HOMEBREW_BUNDLE_FILE\""
  )
  _run_tasks "${tasks[@]}"
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
