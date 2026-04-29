---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Python
  { import = "astrocommunity.pack.python.ruff" }, -- ruff LSP

  -- Web / JS / TS
  { import = "astrocommunity.pack.typescript" }, -- vtsls, js/ts/tsx/jsdoc parsers
  { import = "astrocommunity.pack.svelte" }, -- svelte-language-server, svelte parser
  { import = "astrocommunity.pack.html-css" }, -- html/css LSP, html/css parsers

  -- Data / Config
  { import = "astrocommunity.pack.json" }, -- jsonls, json/jsonc parsers
  { import = "astrocommunity.pack.yaml" }, -- yaml-language-server, yaml parser

  -- Infra / DevOps
  { import = "astrocommunity.pack.docker" }, -- dockerls, docker-compose-ls, hadolint, dockerfile parser
  { import = "astrocommunity.pack.terraform" }, -- terraform-ls, tflint, terraform/hcl parsers

  -- Shell
  { import = "astrocommunity.pack.bash" }, -- bash-language-server, bash parser, zsh support

  -- Lua (nvim)
  { import = "astrocommunity.pack.lua" }, -- lua_ls, stylua, lua parser

  -- Tools
  { import = "astrocommunity.pack.just" }, -- just parser + just-lsp

  -- pack.sql         skipped
  -- pack.markdown    skipped
  -- pack.toml        skipped
}
