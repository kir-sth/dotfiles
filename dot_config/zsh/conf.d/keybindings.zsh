bindkey '^r' atuin-search # Ctrl+R - atuin global search
bindkey '^[[A' atuin-up-search # ↑ normal mode - atuin directory search
bindkey '^[OA' atuin-up-search # ↑ application mode - atuin directory search in tmux/ssh

bindkey '^U' backward-kill-line # Cmd+Delete - delete from cursor to start of line
bindkey '^[[3;3~' kill-word # Fn+Option+Delete - delete from cursor to end of word
bindkey '^[[3;9~' kill-line # Fn+Cmd+Delete - delete from cursor to end of line
