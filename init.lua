vim.g.mapleader = " "    -- Set leader key to space

require("core.options")  -- Basic settings
require("core.keymaps")  -- Key mappings

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- use packages
require("lazy").setup({
  require("core.ui"),
  require("core.lsp"),
  require("core.snippets"),
  require("core.notetaking"),

  -- TODO: latex exporting (markdown file to proper, professional latex pdf)
  -- TODO: can we replace my use of org-agenda for calendar events and todo tracking?
  -- TODO: save cursor location/place in file (across sessions)

}, {
  -- Lazy options
  performance = {
    rtp = {
      disabled_plugins = { -- Disable some default plugins
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
