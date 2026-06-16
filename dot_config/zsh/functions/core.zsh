core::run_tasks() {
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
