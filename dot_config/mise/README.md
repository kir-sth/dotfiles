# mise

`mise` owns language runtimes and development toolchains

## Structure

```zsh
~/.config/mise
├── conf.d/
│   ├── runtimes.toml       # language runtimes and core toolchains
│   ├── dx.toml             # LSPs, formatters, linters, and diagnostics
│   └── tools.toml          # selected development and infrastructure utilities
├── config.toml             # global settings and policies
└── README.md
```

## Tooling

| Language          | LSP                                  | Formatter    | Linter / Diagnostics |
| ----------------- | ------------------------------------ | ------------ | -------------------- |
| Bash / Zsh        | bash-language-server                 | shfmt        | shellcheck           |
| Docker            | docker-language-server               | dockerfmt    | hadolint             |
| Go                | gopls                                | gofmt        | golangci-lint        |
| JS / TS           | vtsls + biome                        | biome        | biome                |
| JSON / HTML / CSS | vscode-langservers-extracted + biome | biome        | biome                |
| Justfile          | just-lsp                             | just --fmt   | -                    |
| KDL               | kdl-lsp                              | kdlfmt       | -                    |
| Markdown          | rumdl                                | rumdl        | rumdl                |
| OpenTofu          | tofu-ls                              | tofu fmt     | tofu validate        |
| Python            | ruff server + ty                     | ruff format  | ruff check + ty      |
| Rust              | rust-analyzer                        | rustfmt      | clippy               |
| SQL               | sqruff lsp                           | sqruff fix   | sqruff lint          |
| Spell Checker     | typos-lsp                            | -            | typos-lsp            |
| Swift             | sourcekit-lsp                        | swift-format | swift format lint    |
| TOML              | tombi                                | tombi        | tombi                |
| YAML              | yaml-language-server                 | yamlfmt      | yamllint             |
