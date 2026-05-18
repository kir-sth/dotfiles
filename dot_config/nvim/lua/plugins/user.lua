---@type LazySpec
return {
  -- Disable DAP (debugger not needed)
  { "nvim-dap", enabled = false },
  { "nvim-dap-ui", enabled = false },
  { "mason-nvim-dap.nvim", enabled = false },

  -- Disable unused null-ls chain (pulled in by AstroNvim core)
  { "none-ls.nvim", enabled = false },
  { "mason-null-ls.nvim", enabled = false },

  -- Disable test runner pulled in by pack.typescript
  { "nvim-neotest/neotest", enabled = false },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        stylua = {
          -- Explicit config path: works in both chezmoi source and deployed context
          prepend_args = { "--config-path", vim.fn.stdpath "config" .. "/.stylua.toml" },
        },
      },
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" }, -- ruff_fix over ruff_organize_imports: applies all autofixes
        sh = { "shfmt" },
        zsh = { "shfmt" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        svelte = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        css = { "biome" },
        sql = { "sqruff" },
        toml = { "tombi" },
        markdown = { "mdformat" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "never",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        -- python: covered by ruff LSP from pack.python.ruff
        javascript = { "biomejs" },
        typescript = { "biomejs" },
        javascriptreact = { "biomejs" },
        typescriptreact = { "biomejs" },
        sql = { "sqruff" },
        markdown = { "markdownlint-cli2" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
}
