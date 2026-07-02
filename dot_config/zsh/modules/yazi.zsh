y() {
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
