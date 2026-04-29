---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "marksman", -- Markdown LSP (pack.markdown skipped)
        "biome", -- JS / TS / JSON / CSS / Svelte formatter + linter
        "sqruff", -- SQL formatter + linter (pack.sql skipped)
        "tombi", -- TOML LSP + formatter + linter (pack.toml skipped)
        "ty", -- Python LSP
        "tree-sitter-cli", -- compiles tree-sitter parsers
      },
    },
  },
}
