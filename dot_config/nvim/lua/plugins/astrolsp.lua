---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    config = {
      ty = {
        cmd = { vim.fn.exepath "ty", "server" },
        filetypes = { "python" },
      },
    },
    formatting = {
      format_on_save = {
        enabled = false, -- conform.nvim handles formatting
      },
      timeout_ms = 1000,
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args) vim.lsp.codelens.refresh { bufnr = args.buf } end,
        },
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client) return client:supports_method "textDocument/semanticTokens/full" end,
        },
      },
    },
  },
}
