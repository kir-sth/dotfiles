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
│   ├── ergonomics.zsh      # modern CLI replacements & shell UX
│   ├── secrets.zsh         # runtime credential injection wrappers
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
up           # update Homebrew packages, apps, and mise tools
gc           # clean Homebrew, mole caches, and unused mise assets
status       # show Brewfile drift and pending chezmoi changes
lock         # dump brew state and track Brewfile and mise configs in chezmoi
check        # run security checks

# yazi
y            # change directory after exit

# zellij
z            # new session
zl           # session list
za           # pick and attach a session
zk / zd      # pick and kill / delete a session
zka / zda    # kill / delete all sessions
zy           # yazi and zsh session template
```
