# dotfiles

Personal macOS dotfiles designed for Apple Silicon and managed with [`chezmoi`](https://www.chezmoi.io/).

## Stack

| Category         | Tools                                              |
| ---------------- | -------------------------------------------------- |
| System           | chezmoi, mole, syncthing, OrbStack                 |
| Terminal & Shell | Ghostty, tmux, zsh (sheldon, starship, fzf, atuin) |
| CLI Essentials   | zoxide, bat, eza, fd, ripgrep, moor                |
| CLI Extras       | dust, procs, bottom, tlrc, freeze, glow, ffmpeg    |
| Editor / IDE     | Neovim (AstroNvim), Zed                            |
| Dev Tools        | mise, uv, bun, cargo, gh, just, task               |
| Dev TUI          | code2prompt, lazygit, sqlit-tui, ghgrab            |
| AI TUI           | Claude Code, Crush                                 |
| AI GUI           | Claude Desktop, ChatGPT, Perplexity                |
| GUI Apps         | Arc, Ferrite, Figma, IINA, Raycast                 |
| Utils            | rwb, Bitwarden, Stats                              |

## Structure

```bash
~/.config/atuin/config.toml      # shell history
~/.config/brew/Brewfile          # homebrew packages
~/.config/freeze/user.json       # code screenshot tool
~/.config/ghostty/config         # ghostty terminal
~/.config/glow/config            # markdown reader
~/.config/mise/mise.toml         # runtime versions
~/.config/mole/whitelist         # mole cleaner whitelist
~/.config/nvim/                  # neovim (AstroNvim)
~/.config/sheldon/plugins.toml   # sheldon plugin definitions
~/.config/starship/starship.toml # prompt
~/.config/tmux/tmux.conf         # tmux
~/.config/zsh/
├── .zshrc                       # entry point
├── .zprofile                    # brew shellenv
├── local.zsh                    # secrets (not tracked)
└── conf.d/
    ├── aliases.zsh              # all aliases
    ├── env.zsh                  # exports
    ├── functions.zsh            # shell functions
    ├── inits.zsh                # tool inits and completions
    ├── keybindings.zsh          # keybindings
    ├── options.zsh              # setopt, history
    └── plugins.zsh              # compinit + sheldon
~/.gitconfig                     # git
~/.zshenv                        # ZDOTDIR
```

## Install

On a clean machine, run a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/kir-sth/dotfiles/main/install.sh | bash
```

> **Note:** If Xcode CLI Tools are not installed, the script will prompt you to install them and exit. Re-run the command after installation completes.

`install.sh` sequentially:

1. Checks Xcode CLI Tools
2. Installs Homebrew
3. Installs chezmoi
4. Clones this repo and applies dotfiles
5. Creates runtime directories
6. Installs packages from Brewfile
7. Installs mise tools
8. Locks sheldon plugins

## Post-install

```bash
# Bitwarden
rbw config set email <your-email>
rbw register

# Neovim plugins
nvim
# :AstroUpdate — update AstroNvim framework + Lazy plugins + Mason tools

# Fill with your API keys
# Recommended: store API keys in Bitwarden and export them as env vars
nvim ~/.config/zsh/local.zsh
```

## Usage

```bash
# Config shortcuts
brewfile     # cat Brewfile
misefile     # cat mise.toml
configs      # open chezmoi source in nvim + apply

# General
up           # brew update + upgrade + bundle (includes mas apps) + mise upgrade
gc           # brew clean + mole clean + mise prune + docker prune
brewed       # dump current state to Brewfile
status       # brew bundle check + chezmoi diff
setup        # unlock bitwarden + load env vars from local.zsh
```

## Updating dotfiles

```bash
chezmoi edit file     # edit and auto-apply
chezmoi add file      # track a new file
chezmoi diff          # preview pending changes
chezmoi apply         # apply all changes
chezmoi update        # pull from GitHub + apply
```
