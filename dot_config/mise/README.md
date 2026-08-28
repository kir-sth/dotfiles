# mise

`mise` owns language runtimes and development toolchains

## Structure

```zsh
~/.config/mise
├── conf.d/
│   ├── runtimes.toml       # language runtimes and core toolchains
│   ├── tooling.toml        # LSPs, formatters, linters, and diagnostics
│   └── utilities.toml      # selected dev utilities
├── config.toml             # global settings and policies
└── README.md
```

## Tooling

| Language          | LSP                                  | Formatter    | Linter            |
| ----------------- | ------------------------------------ | ------------ | ----------------- |
| All text          | typos-lsp                            | -            | typos-lsp         |
| Markdown          | rumdl                                | rumdl        | rumdl             |
| Bash / Zsh        | bash-language-server                 | shfmt        | shellcheck        |
| Python            | ruff server + ty                     | ruff format  | ruff check + ty   |
| JS / TS           | vtsls + biome                        | biome        | biome             |
| Go                | gopls                                | gofmt        | golangci-lint     |
| Rust              | rust-analyzer                        | rustfmt      | clippy            |
| Swift             | sourcekit-lsp                        | swift format | swift format lint |
| SQL               | sqruff lsp                           | sqruff fix   | sqruff lint       |
| TOML              | tombi                                | tombi        | tombi             |
| YAML              | yaml-language-server                 | yamlfmt      | yamllint          |
| KDL               | kdl-lsp                              | kdlfmt       | -                 |
| JSON / HTML / CSS | vscode-langservers-extracted + biome | biome        | biome             |
| Docker            | docker-language-server               | dockerfmt    | hadolint          |
| Justfile          | just-lsp                             | -            | -                 |
