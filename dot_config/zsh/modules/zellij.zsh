alias z="zellij"
alias zl="zellij list-sessions"
alias zka="zellij kill-all-sessions --yes"
alias zda="zellij delete-all-sessions --yes"

za() {
  local session

  session=$(
    zellij list-sessions --short | gum choose
  ) || return

  zellij attach "$session"
}
