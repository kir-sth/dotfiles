#!/usr/bin/env bash
# Usage (fresh machine):
#   curl -fsSL https://raw.githubusercontent.com/kir-sth/dotfiles/main/install.sh | bash
# Usage (already cloned):
#   bash ~/.local/share/chezmoi/install.sh
set -euo pipefail

GITHUB_USER="kir-sth"
BREWFILE="$HOME/.config/brew/Brewfile"
CHEZMOI_DIR="$HOME/.local/share/chezmoi"

# ── Helpers ──────────────────────────────────────────────────────────────────
step() { printf "\n\033[1;34m→\033[0m %s\n" "$*"; }
ok()   { printf "\033[1;32m✓\033[0m %s\n" "$*"; }
info() { printf "  %s\n" "$*"; }

# ── 1. Xcode CLI Tools ───────────────────────────────────────────────────────
step "Xcode CLI Tools"
if xcode-select -p &>/dev/null; then
  ok "Already installed"
else
  info "Installing — confirm the dialog, then re-run this script"
  xcode-select --install
  exit 0
fi

# ── 2. Homebrew ──────────────────────────────────────────────────────────────
step "Homebrew"
if command -v brew &>/dev/null; then
  ok "Already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
ok "Ready"

# ── 3. chezmoi ───────────────────────────────────────────────────────────────
step "chezmoi"
if command -v chezmoi &>/dev/null; then
  ok "Already installed"
else
  brew install chezmoi
fi
ok "Ready"

# ── 4. Dotfiles ──────────────────────────────────────────────────────────────
step "Dotfiles"
if [[ -d "$CHEZMOI_DIR/.git" ]]; then
  info "Repo already present — applying"
  chezmoi apply
else
  info "Cloning github.com/$GITHUB_USER/dotfiles and applying"
  chezmoi init --apply "$GITHUB_USER"
fi
ok "Applied"

# ── 5. Runtime directories ───────────────────────────────────────────────────
step "Runtime directories"
mkdir -p "$HOME/.local/state/zsh"
mkdir -p "$HOME/.local/state/mise"
mkdir -p "$HOME/.local/state/atuin/logs"
mkdir -p "$HOME/.local/state/fzf"
ok "Created"

# ── 6. Homebrew packages ─────────────────────────────────────────────────────
step "Homebrew packages"
brew bundle --file="$BREWFILE"
ok "Installed"

# ── 7. mise tools ────────────────────────────────────────────────────────────
step "mise tools"
mise install
ok "Installed"

# ── 8. Yazi packages ─────────────────────────────────────────────────────────
step "Yazi packages"
ya pkg install
ok "Installed"

# ── 9. Sheldon plugins ───────────────────────────────────────────────────────
step "Sheldon plugins"
sheldon lock
ok "Locked"

# ── Done ─────────────────────────────────────────────────────────────────────
printf "\n\033[1;32m══ Setup complete ══\033[0m\n\n"
info "Open a new terminal to start."
info ""
info "Post-install:"
info "  • rbw config set email <your_email>"
info "  • rbw register"
info "  • nvim -> :AstroUpdate"
info "  • nvim ~/.config/zsh/local.zsh  # fill with your API keys"
