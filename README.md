# dotfiles

Personal macOS dotfiles designed for Apple Silicon and managed with [`chezmoi`](https://www.chezmoi.io/).

- XDG-first layout
- Reproducible setup via Brewfile and mise
- Minimal and composable CLI tooling
- Fast interactive zsh environment
- Single-command bootstrap on a fresh machine

## Stack

| Category         | Tools                                                        |
| ---------------- | ------------------------------------------------------------ |
| System           | chezmoi, mole, rbw, OrbStack, bumblebee                      |
| Terminal & Shell | Ghostty, Zellij, zsh (sheldon, starship, fzf, atuin)         |
| CLI Essentials   | yazi, zoxide, bat, eza, fd, ripgrep, jaq, moor               |
| CLI Extras       | dust, procs, bottom, tlrc, ffmpeg, ouch, delta, freeze, gum  |
| Editor / IDE     | Neovim (AstroNvim), Zed                                      |
| Dev Runtimes     | mise, Bun, Python, Go, Rust, Swift                           |
| Dev Tools        | lazygit, sqlit-tui                                           |
| Dev Extra        | gh, just, task, ghgrab, glow, jnv                            |
| AI               | code2prompt, Crush, Claude Desktop                           |
| Apps             | Zen, Figma, IINA, Raycast, Telegram, Better Resource Monitor |

## Configuration

The shell, dev tooling, and editor are the most involved pieces and are documented separately:

- **[zsh](dot_config/zsh/README.md)** — shell entry point, CLI tool integration, aliases and functions
- **[mise](dot_config/mise/README.md)** — dev runtimes, plus LSPs/formatters/linters per language
- **[nvim](dot_config/nvim/README.md)** — AstroNvim setup, language support, plugins

## Structure

```zsh
~/.config/
├── atuin         # shell history sync
├── bottom        # system monitor
├── freeze        # code screenshot tool
├── ghostty       # terminal emulator settings
├── git           # git config
├── glow          # markdown reader
├── homebrew      # brew bundle and env
├── jnv           # interactive json viewer
├── lazygit       # terminal UI for git commands
├── mise          # dev tools manager
├── mole          # cleaner whitelist
├── nvim          # AstroNvim
├── sheldon       # plugin definitions
├── starship      # shell prompt
├── yazi          # file manager
├── zellij        # terminal multiplexer
└── zsh           # zsh config
~/.zshenv         # ZDOTDIR
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
6. Installs packages and applications from Brewfile
7. Installs mise tools
8. Installs yazi packages and themes
9. Installs and builds bat / delta theme
10. Locks sheldon plugins

## Post-install

```bash
# Bitwarden
rbw config set email <your-email>
rbw register

# Neovim plugins
nvim
# :AstroUpdate — update AstroNvim framework + Lazy plugins + Mason tools
```

## Usage

```bash
# config shortcuts
brewfile     # cat Brewfile
misefiles    # cat mise configs
configs      # open chezmoi source in nvim, then apply

# system tasks
up           # update Homebrew packages, apps, and mise tools
gc           # clean Homebrew, mole caches, and unused mise assets
status       # show Brewfile drift and pending chezmoi changes
lock         # dump brew state and track Brewfile and mise configs in chezmoi
check        # run security checks
```

## Updating dotfiles

```bash
chezmoi edit file     # edit and auto-apply
chezmoi add file      # track a new file
chezmoi diff          # preview pending changes
chezmoi apply         # apply all changes
chezmoi update        # pull from GitHub + apply
```
