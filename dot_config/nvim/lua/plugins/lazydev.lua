---@type LazySpec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = function(_, opts)
    opts.library = opts.library or {}
    vim.list_extend(opts.library, {
      { path = "lazy.nvim" },
      { path = "astrocore" },
      { path = "astrolsp" },
      { path = "astroui" },
      { path = vim.env.VIMRUNTIME },
    })
    return opts
  end,
}
