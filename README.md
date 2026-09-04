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
| System           | chezmoi, mole, rbw, bumblebee                                |
| Terminal & Shell | Ghostty, Zellij, zsh (sheldon, starship, fzf, atuin)         |
| CLI Essentials   | yazi, zoxide, bat, eza, fd, ripgrep, jaq, moor               |
| CLI Extras       | dust, procs, bottom, tlrc, ffmpeg, ouch, delta, freeze, gum  |
| Editor / IDE     | Helix, Zed                                                   |
| Runtimes         | mise, Bun, Python, Go, Rust, Swift                           |
| Development      | lazygit, sqlit-tui, gh, just, task, ghgrab, glow, jnv        |
| Infrastructure   | OpenTofu, OrbStack                                           |
| AI               | code2prompt, Crush, Claude Desktop                           |
| Apps             | Zen, Figma, IINA, Raycast, Telegram, Better Resource Monitor |

## Configuration

The shell, dev tooling, and editor are documented separately:

- **[zsh](dot_config/zsh/README.md)** — shell entry point, aliases and functions
- **[mise](dot_config/mise/README.md)** — runtimes, development utilities, and language tooling
- **[helix](dot_config/helix/README.md)** — helix settings and language support

## Structure

```zsh
~/.config/
├── atuin         # shell history sync
├── bat           # bat theme
├── bottom        # system monitor
├── freeze        # code screenshot tool
├── ghostty       # terminal emulator settings
├── git           # git config and ignore
├── glow          # markdown reader
├── helix         # editor
├── homebrew      # brew bundle and env
├── jnv           # interactive json viewer
├── lazygit       # terminal UI for git commands
├── mise          # dev tools manager
├── mole          # cleaner whitelist
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
9. Builds bat theme cache
10. Locks sheldon plugins

## Usage

```bash
# config shortcuts
brewfile     # cat Brewfile
misefiles    # cat mise configs
configs      # open chezmoi source in editor, then apply

# system tasks
up           # update Homebrew packages, apps, and mise tools
gc           # clean Homebrew, mole caches, and unused mise assets
status       # show Brewfile drift and pending chezmoi changes
lock         # dump brew state, track Brewfile and mise configs in chezmoi
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
