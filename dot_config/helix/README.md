# Helix

Helix is the primary modal editor in this setup.

- `hx` is wired as `EDITOR`, `VISUAL`, the Git editor, merge tool, and Lazygit editor
- LSPs, formatters, linters, and diagnostics are installed through `mise`
- Language-specific behavior is defined in `languages.toml`
- The editor uses the native `tokyonight_storm` theme

## Structure

```zsh
~/.config/helix/
├── config.toml     # global editor behavior
├── languages.toml  # language servers, formatting and diagnostic tools
└── README.md
```
