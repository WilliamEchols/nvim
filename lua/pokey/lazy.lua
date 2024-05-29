local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- theme
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- which-key support
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},

	-- telescope fuzzy finder
    { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { 'nvim-lua/plenary.nvim' } },

    -- oil
    -- { 'stevearc/oil.nvim', opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" }, },

	-- undotree
	{ "mbbill/undotree" },

    -- conform
    { 'stevearc/conform.nvim', opts = {}, },

    -- dashboard
    { 'goolord/alpha-nvim', config = function () require'alpha'.setup(require'alpha.themes.dashboard'.config) end },

    -- tree
    { "nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons", },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                    side = "left",
                    preserve_window_proportions = true,
                }
            })
        end,
    },

    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- orgroam
    {
        "chipsenkbeil/org-roam.nvim",
        tag = "0.1.0",
        dependencies = {
            {
                "nvim-orgmode/orgmode",
                tag = "0.3.4",
            },
        },
    },


    -- orgmode bullets
    { 'nvim-orgmode/org-bullets.nvim',
      config = function()
        require('org-bullets').setup()
      end
    },

    -- nabla for unicode latex rendering
    { 'jbyuki/nabla.nvim' },

    -- fugitive for github integration 
    { 'tpope/vim-fugitive' },
   
})
