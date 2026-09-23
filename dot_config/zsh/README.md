# Zsh

Interactive shell config and the entry point for most of the CLI tooling in this repo.

## Structure

```zsh
~/.config/zsh/
├── core/
│   ├── env.zsh             # exports
│   ├── options.zsh         # setopt, history
│   ├── inits.zsh           # eval tools
│   ├── completions.zsh     # zstyle, compinit, zcompile
│   └── keybindings.zsh     # keyboard shortcuts
├── modules/
│   ├── bumblebee.zsh       # supply-chain catalog sync + scan
│   ├── cloudflare.zsh      # markdown extraction via Cloudflare API
│   ├── ergonomics.zsh      # modern CLI replacements and shell UX
│   ├── secrets.zsh         # runtime credential injection wrappers + ssh-agent key loading
│   ├── system.zsh          # system maintenance tasks
│   ├── yazi.zsh            # yazi cd-on-exit wrapper
│   └── zellij.zsh          # zellij functions and aliases
├── .zshrc                  # entry point
├── .zprofile               # brew shellenv, PATH
└── README.md
~/.zshenv                   # ZDOTDIR
```

## Usage

```bash
# config shortcuts
brewfile     # cat Brewfile
misefiles    # cat mise configs
configs      # open chezmoi source in editor, then apply

# system maintenance
system       # interactive CLI for all system maintenance tasks
status       # diff local drift (Brewfile, chezmoi, git)
check        # audit security vulnerabilities and outdated packages
doctor       # run health diagnostics (brew, mise, mole)
up           # upgrade Homebrew packages, apps, and mise tools
lock         # snapshot current state to Brewfile and chezmoi
gc           # clean caches, orphaned packages and builds

# ssh
ssh-load     # unlock Bitwarden and load SSH keys into ssh-agent

# yazi
y            # change directory after exit

# zellij
z            # new session (pick layout, optionally set name)
zl           # session list
za           # pick and attach a session
zk / zd      # pick and kill / delete a session
zka / zda    # kill / delete all sessions
```
