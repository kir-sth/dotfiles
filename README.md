# dotfiles

Personal macOS dotfiles designed for Apple Silicon and managed with [`chezmoi`](https://www.chezmoi.io/).

## Stack

| Category         | Tools                                                     |
| ---------------- | --------------------------------------------------------- |
| System           | chezmoi, mole, syncthing, rwb, OrbStack                   |
| Terminal & Shell | Ghostty, tmux, zsh (sheldon, starship, fzf, atuin)        |
| CLI Essentials   | zoxide, bat, eza, fd, ripgrep, moor                       |
| CLI Extras       | dust, procs, bottom, tlrc, ffmpeg, sevenzip, diff, freeze |
| Editor / IDE     | Neovim (AstroNvim), Zed                                   |
| Dev Tools        | mise, uv, bun, cargo, gh, just, task                      |
| Dev TUI          | yazi, code2prompt, lazygit, sqlit-tui, ghgrab, glow       |
| AI               | Claude Code, Crush, Claude Desktop, ChatGPT, Perplexity   |
| Apps             | Zen, Ferrite, Figma, IINA, Raycast, Stats                 |

## Structure

```bash
~/.config/
├── atuin                       # shell history sync
├── bottom                      # system monitor
├── brew                        # homebrew bundle
├── freeze                      # code screenshot tool
├── ghostty                     # terminal emulator settings
├── git                         # git config
├── glow                        # markdown reader
├── mise                        # dev tools manager
├── mole                        # cleaner whitelist
├── nvim                        # AstroNvim
├── sheldon                     # plugin definitions
├── starship                    # shell prompt
├── tmux                        # terminal multiplexer
├── yazi                        # file manager
└── zsh/
    ├── .zshrc                  # entry point
    ├── .zprofile               # brew shellenv
    ├── local.zsh               # secrets (not tracked)
    └── conf.d/
        ├── aliases.zsh         # aliases
        ├── env.zsh             # exports
        ├── functions.zsh       # shell functions
        ├── inits.zsh           # tool inits
        ├── keybindings.zsh     # keyboard shortcuts
        ├── options.zsh         # setopt, history
        └── plugins.zsh         # compinit + sheldon
~/.zshenv                       # ZDOTDIR
```

## Install

On a clean machine, run a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/kir-sth/dotfiles/main/install.sh | bash
```

> **Note:** If Xcode CLI Tools are not installed, the script will prompt you to install them and exit. Re-run the command after installation completes.

`install.sh` sequentially:

1. Ensures Xcode CLI Tools are installed
2. Installs Homebrew
3. Installs chezmoi
4. Initializes and applies dotfiles via chezmoi
5. Creates runtime directories
6. Installs packages from Brewfile
7. Installs mise tools
8. Installs yazi packages and themes
9. Locks sheldon plugins

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
gc           # brew clean + mole clean + mise prune
brewed       # dump current state to Brewfile
status       # brew bundle check + chezmoi diff
setup        # unlock bitwarden + load env vars from local.zsh
y            # open yazi and change dir on exit
```

## Updating dotfiles

```bash
chezmoi edit file     # edit and auto-apply
chezmoi add file      # track a new file
chezmoi diff          # preview pending changes
chezmoi apply         # apply all changes
chezmoi update        # pull from GitHub + apply
```
