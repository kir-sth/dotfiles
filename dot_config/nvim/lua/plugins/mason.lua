---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "markdown-oxide", -- markdown LSP, wiki-links, vault
        "markdownlint-cli2", -- markdown linter
        "mdformat", -- markdown formatter
        "biome", -- JS / TS / JSON / CSS / Svelte formatter + linter
        "sqruff", -- SQL formatter + linter (pack.sql skipped)
        "tombi", -- TOML LSP + formatter + linter (pack.toml skipped)
        "ty", -- Python LSP
        "tree-sitter-cli", -- compiles tree-sitter parsers
      },
    },
  },
}
