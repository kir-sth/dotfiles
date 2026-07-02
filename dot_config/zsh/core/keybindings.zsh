# ATUIN
bindkey '^r'   atuin-search     # Ctrl+R — global history search
bindkey '^[[A' atuin-up-search  # Up (normal cursor mode) — search current directory
bindkey '^[OA' atuin-up-search  # Up (application cursor mode) — Zellij / SSH

# NAVIGATION (explicit bindings for Zellij locked mode / Zed / SSH)
bindkey '^A'  beginning-of-line  # Cmd+Left — beginning of line
bindkey '^E'  end-of-line        # Cmd+Right — end of line
bindkey '^[b' backward-word      # Option+Left  (ESC+b) — word left
bindkey '^[f' forward-word       # Option+Right (ESC+f) — word right

# DELETION
bindkey '^U'   backward-kill-line  # Cmd+Delete — delete to beginning of line
bindkey '^[^?' backward-kill-word  # Option+Backspace — delete word left
