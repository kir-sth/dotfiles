# Neovim Config

AstroNvim configuration.

## Stack

- **Base**: [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- **Plugins**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **LSP / tools**: Mason via [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- **Formatter**: [conform.nvim](https://github.com/stevearc/conform.nvim)
- **Linter**: [nvim-lint](https://github.com/mfussenegger/nvim-lint)

## Language support

Community packs (`lua/community.lua`) handle LSP, treesitter, and tooling per language.  
Manual entries in `mason.lua` and `treesitter.lua` cover languages without a pack.

## Usage

```bash
nvim
# First launch and regular updates
# :AstroUpdate                        - update framework + Lazy plugins + Mason tools

# Lazy plugins
# :Lazy                               - open Lazy TUI
# :Lazy clean                         - remove unused plugins
# :Lazy install <plugin>              - install plugin
# :Lazy update <plugin>               - update plugin
# :Lazy sync                          - clean + install + update plugins

# Mason packages
# :Mason                              - open Mason TUI
# :MasonUpdate                        - update Mason registry
# :MasonInstall <package>              - install package
# :MasonUninstall <package>           - remove package

# Additionally
# :TSUpdate                           - update tree-sitter
# :lua Snacks.picker.notifications()  - open notifications TUI
```

## Files

| File                         | Purpose                                       |
| ---------------------------- | --------------------------------------------- |
| `lua/community.lua`          | AstroCommunity pack imports                   |
| `lua/plugins/mason.lua`      | Manual Mason tools (no pack available)        |
| `lua/plugins/treesitter.lua` | Manual treesitter parsers (no pack available) |
| `lua/plugins/user.lua`       | conform.nvim + nvim-lint configuration        |
| `lua/plugins/astrocore.lua`  | Editor options and keymaps                    |
| `lua/plugins/astrolsp.lua`   | LSP behaviour (formatting, hints)             |
