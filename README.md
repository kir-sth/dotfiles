# dotfiles

Personal macOS dotfiles designed for Apple Silicon and managed with [`chezmoi`](https://www.chezmoi.io/).

- XDG-first layout
- Reproducible setup via Brewfile and mise
- Minimal and composable CLI tooling
- Fast interactive zsh environment
- Single-command bootstrap on a fresh machine

## Stack

| Category         | Tools                                                           |
| ---------------- | --------------------------------------------------------------- |
| System           | chezmoi, mole, syncthing, rbw, OrbStack, bumblebee              |
| Terminal & Shell | Ghostty, tmux, zsh (sheldon, starship, fzf, atuin)              |
| CLI Essentials   | zoxide, bat, eza, fd, ripgrep, jaq, moor                        |
| CLI Extras       | age, dust, procs, bottom, tlrc, ffmpeg, sevenzip, delta, freeze |
| Editor / IDE     | Neovim (AstroNvim), Zed                                         |
| Dev Tools        | mise, uv, bun, cargo, go, gh, just, task                        |
| Dev TUI          | yazi, code2prompt, lazygit, sqlit-tui, ghgrab, glow, jnv        |
| AI               | Claude Code, Crush, Claude Desktop, ChatGPT, Perplexity         |
| Apps             | Zen, Ferrite, Figma, IINA, Raycast, Better Resource Monitor     |

## Structure

```zsh
~/.config/
├── atuin                       # shell history sync
├── bottom                      # system monitor
├── freeze                      # code screenshot tool
├── ghostty                     # terminal emulator settings
├── git                         # git config
├── glow                        # markdown reader
├── homebrew                    # brew bundle and env
├── jnv                         # interactive json viewer
├── lazygit                     # terminal UI for git commands
├── mise                        # dev tools manager
├── mole                        # cleaner whitelist
├── nvim                        # AstroNvim
├── sheldon                     # plugin definitions
├── starship                    # shell prompt
├── tmux                        # terminal multiplexer
├── yazi                        # file manager
└── zsh/
    ├── conf.d/
    │   ├── aliases.zsh         # aliases
    │   ├── env.zsh             # exports
    │   ├── inits.zsh           # tool inits
    │   ├── keybindings.zsh     # keyboard shortcuts
    │   ├── options.zsh         # setopt, history
    │   └── plugins.zsh         # compinit + sheldon
    ├── functions/
    │   ├── bumblebee.zsh       # supply-chain catalog sync + scan
    │   ├── cloudflare.zsh      # markdown extraction via Cloudflare API
    │   ├── commands.zsh        # interactive workflows
    │   ├── core.zsh            # shared task-runner helper
    │   ├── secrets.zsh         # runtime credential injection wrappers
    │   └── yazi.zsh            # yazi cd-on-exit wrapper
    ├── .zshrc                  # entry point
    └── .zprofile               # brew shellenv
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
6. Installs packages and applications from Brewfile
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
```

## Usage

```bash
# config shortcuts
brewfile     # cat Brewfile
misefile     # cat mise.toml
configs      # open chezmoi source in nvim + apply

# commands
up           # update Homebrew packages, apps, and mise tools
gc           # clean Homebrew, mole caches, and unused mise assets
status       # show Brewfile drift and pending chezmoi changes
lock         # dump brew state and track Brewfile and mise.toml in chezmoi
check        # run security checks

# misc
getmd        # fetch a URL as markdown via Cloudflare browser rendering
y            # open yazi and change shell directory on exit
```

## Updating dotfiles

```bash
chezmoi edit file     # edit and auto-apply
chezmoi add file      # track a new file
chezmoi diff          # preview pending changes
chezmoi apply         # apply all changes
chezmoi update        # pull from GitHub + apply
```
