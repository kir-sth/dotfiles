---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Core Neovim
      "vim",
      "vimdoc",

      -- Languages without packs
      "sql", -- pack.sql skipped

      -- Markup / Docs (pack.markdown skipped)
      "markdown",
      "markdown_inline",

      -- Config
      "ssh_config",

      -- Git
      "gitcommit",
      "gitignore",
      "gitattributes",
      "git_rebase",
      "git_config",

      -- Tools
      "tmux",
      "make",
      "mermaid",
      "todotxt",
    },
  },
  init = function() require("nvim-treesitter.install").prefer_git = true end,
}
