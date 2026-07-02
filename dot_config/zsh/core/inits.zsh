# PLUGIN MANAGER
eval "$(sheldon source)"

# TOOL ACTIVATIONS
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(fzf --zsh)"
eval "$(atuin init zsh)"
