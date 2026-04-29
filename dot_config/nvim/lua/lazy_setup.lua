require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    -- version = "^5", -- uncomment to pin to stable
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = nil,
      update_notifications = true,
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  checker = { enabled = true, notify = true, frequency = 86400 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "tutor",
        "man",
        "matchit",
        "matchparen",
      },
    },
  },
} --[[@as LazyConfig]])
