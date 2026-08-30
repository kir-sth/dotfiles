alias z="zellij"
alias zl="zellij list-sessions"
alias zka="zellij kill-all-sessions --yes"
alias zda="zellij delete-all-sessions --yes"

_z_execute_with_picker() {
  local session action
  action="$1"

  session=$(
    zellij list-sessions --short | gum choose
  ) || return

  zellij "$action" "$session"
}

za() { _z_execute_with_picker "attach"; }
zk() { _z_execute_with_picker "kill-session"; }
zd() { _z_execute_with_picker "delete-session"; }

zy() {
    local target="${1:-.}"
    zellij --layout code options --default-cwd "$target"
}
