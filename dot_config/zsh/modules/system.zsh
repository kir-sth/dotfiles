# TASK RUNNER
system::run_tasks() {
  local title="$1"
  shift
  local -a tasks=("$@")
  local selected cmd

  gum style --bold --foreground 39 "── $title ──"

  selected=$(
    printf "%s\n" "${tasks[@]}" | gum choose --no-limit --selected="${(j:,:)tasks}"
  ) || return

  [[ -z "$selected" ]] && return

  for cmd in ${(f)selected}; do
    gum style \
      --border normal \
      --border-foreground 240 \
      --padding "0 1" \
      --foreground 244 \
      "› $cmd"
    eval "$cmd"
  done
}

# MAIN SYSTEM DISPATCHER
system() {
  local action="$1"

  if [[ -z "$action" ]]; then
    action=$(gum choose \
      "status  : diff local drift (Brewfile, chezmoi, git)" \
      "check   : audit security vulnerabilities and outdated packages" \
      "doctor  : run health diagnostics (brew, mise, mole)" \
      "up      : upgrade Homebrew packages, apps, and mise tools" \
      "lock    : snapshot current state to Brewfile and chezmoi" \
      "gc      : clean caches, orphaned packages and builds"
    ) || return
    action="${action%% *}"
  fi

  case "$action" in
    (status)
      system::run_tasks "Local Drift & Sync Status" \
        "brew bundle check --verbose" \
        "chezmoi diff | delta --paging=never" \
        "git -C \"$XDG_DATA_HOME/chezmoi\" -c core.pager=\"delta --paging=never\" status -s"
      ;;
    (check)
    # TODO: Pending fix schema_version v0.2.0
    # "bumblebee::sync && bumblebee::scan" \
      system::run_tasks "Audit & Outdated Packages" \
        "brew vulns --deps" \
        "brew outdated --greedy" \
        "mise outdated --bump --inactive"
      ;;
    (doctor)
      system::run_tasks "Health Diagnostics" \
        "brew doctor" \
        "mise doctor" \
        "mole optimize"
      ;;
    (up|upgrade)
      system::run_tasks "System Upgrade" \
        "brew update" \
        "brew upgrade --greedy" \
        "brew bundle" \
        "mise upgrade"
      ;;
    (lock)
      system::run_tasks "Lock & Snapshot State" \
        "brew bundle dump --force --file=\"$HOMEBREW_BUNDLE_FILE\"" \
        "chezmoi add \"$HOMEBREW_BUNDLE_FILE\"" \
        "chezmoi add \"$XDG_CONFIG_HOME/mise\""
      ;;
    (gc|clean)
      system::run_tasks "Garbage Collection & Cleanup" \
        "brew bundle cleanup --force" \
        "brew autoremove" \
        "brew cleanup --prune=all" \
        "mise prune" \
        "mole clean" \
        "mole purge"
      ;;
    (*)
      echo "Usage: system [status|check|doctor|up|lock|gc]"
      return 1
      ;;
  esac
}

# SYSTEM MAINTENANCE
alias status="system status"
alias check="system check"
alias doctor="system doctor"
alias up="system upgrade"
alias lock="system lock"
alias gc="system clean"

# CONFIG SHORTCUTS
alias brewfile="bat -l ruby $HOMEBREW_BUNDLE_FILE"
alias misefiles="bat \"$XDG_CONFIG_HOME\"/mise/config.toml \"$XDG_CONFIG_HOME\"/mise/conf.d/*.toml"
alias configs="(cd \"$XDG_DATA_HOME/chezmoi\" && hx .) && chezmoi apply"
