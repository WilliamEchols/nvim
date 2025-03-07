-- user interface

return {
  { -- syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua" }, -- NOTE: may need to add more languages
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  { -- kanagawa color scheme
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
	  config = function()
		  vim.cmd("colorscheme kanagawa-wave")
    end
  },
  { -- statusline
    "sschleemilch/slimline.nvim", opts = { style = "fg" }
  },
  { -- file tree
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      local builtin = require("nvim-tree.api")
      vim.keymap.set('n', '\\', builtin.tree.toggle, { desc = 'Toggle nvim-tree' })
    end
  },
  { -- keymap completion recommendation
    "folke/which-key.nvim", -- TODO: can we use icons in which-key?
    event = "VeryLazy",
    opts = {
      preset = "helix",
      delay = 0
    },
    keys = {
      {
        "<leader>?",
        config = function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        preset = { -- NOTE: header looks bad below, but this is how to make it render correctly ¯\_(ツ)_/¯
          header = [[
                __
___     ___    ___   __  __ /\_\    ___ ___
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \
  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "ls",
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      image = { enabled = true, math = { enabled = false } },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {}
  },
  { -- latex rendering with Kitty Graphics Protocol
    'Thiago4532/mdmath.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {}
  },
  { -- markdown
    "OXY2DEV/markview.nvim",
    lazy = false
  },
  { -- fuzzy finding
    'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope [f]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope [f]ind [g]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope [f]ind [b]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope [f]ind [h]elp' })
    end
  },
  { -- RSS feeds -- TODO: Finish configuring
    "neo451/feed.nvim",
    cmd = "Feed",
    config = function()
      require("feed").setup({
        feeds = {
          { "https://xkcd.com/rss.xml", name = "xkcd", tags = {} }
        }
      })
    end
  },
}
