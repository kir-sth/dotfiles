# Neovim Config

AstroNvim configuration.

## Stack

- **Base**: [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- **Plugins**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP / tools**: Mason via [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- **Formatter**: [conform.nvim](https://github.com/stevearc/conform.nvim)
- **Linter**: [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- **Colorscheme**: astrodark

Disabled: DAP (+ mason-nvim-dap), none-ls (+ mason-null-ls), neotest — not part of this workflow.

## Language support

Community packs (`lua/community.lua`) handle LSP, treesitter, and tooling per language.
Manual entries in `mason.lua` and `treesitter.lua` cover languages without a pack.

## Structure

```zsh
~/.config/nvim
├── .neoconf.json             # per-project LSP overrides
├── .stylua.toml              # Lua formatter config
├── init.lua                  # bootstraps lazy.nvim
├── lazy-lock.json
├── lua
│   ├── community.lua         # AstroCommunity pack imports
│   ├── lazy_setup.lua        # lazy.nvim plugin setup
│   ├── plugins
│   │   ├── astrocore.lua     # editor options, diagnostics, keymaps
│   │   ├── astrolsp.lua      # LSP behaviour (formatting, hints)
│   │   ├── astroui.lua       # colorscheme
│   │   ├── lazydev.lua       # lua_ls library paths
│   │   ├── mason.lua         # tools without an astrocommunity pack
│   │   ├── neo-tree.lua      # file tree
│   │   ├── treesitter.lua    # parsers without a pack
│   │   └── user.lua          # conform.nvim + nvim-lint configuration
│   └── polish.lua            # runs last
├── neovim.yml                # selene type definitions
├── selene.toml               # Lua linter config
└── README.md
```

## Usage

```zsh
# First launch and regular updates
:AstroUpdate                        # update framework + Lazy plugins + Mason tools

# Lazy plugins
:Lazy                               # open Lazy TUI
:Lazy clean                         # remove unused plugins
:Lazy install plugin                # install plugin
:Lazy update plugin                 # update plugin
:Lazy sync                          # clean + install + update plugins

# Mason packages
:Mason                              # open Mason TUI
:MasonUpdate                        # update Mason registry
:MasonInstall package               # install package
:MasonUninstall package             # remove package

# Additionally
:TSUpdate                           # update tree-sitter
:lua Snacks.picker.notifications()  # open notifications TUI
```
