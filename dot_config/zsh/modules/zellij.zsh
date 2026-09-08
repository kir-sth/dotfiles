alias zl="zellij list-sessions"
alias zka="zellij kill-all-sessions --yes"
alias zda="zellij delete-all-sessions --yes"

_z_execute_with_picker() {
  local action session

  action="$1"
  session=$(zellij list-sessions --short | gum choose) || return

  zellij "$action" "$session"
}

za() { _z_execute_with_picker attach; }
zk() { _z_execute_with_picker kill-session; }
zd() { _z_execute_with_picker delete-session; }

z() {
  local layout session
  local -a args

  layout=$(gum choose default lazygit yazi) || return
  session=$(gum input --prompt 'Create Zellij session: ') || return

  args=(--new-session-with-layout "$layout")
  [[ -n $session ]] && args+=(--session "$session")

  zellij "${args[@]}"
}
