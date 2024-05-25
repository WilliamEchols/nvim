-- Keymaps
-- <Space> for map leader
-- <Space>n for org-roam
-- <Space>i for IDE layout
-- <C-w> for splits

-- Files
-- ~/.config/nvim/orgfiles

-- <space> as the default <leader> key
vim.g.mapleader = " "

-- use yank/paste with system keyboard
vim.opt.clipboard = 'unnamedplus'

-- theme
vim.cmd[[colorscheme tokyonight-moon]]
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "go", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- conform
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    go = { "goimports" },
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require('conform').format()
  end,
})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Configure tab for IDE
function SetupIDELayout()
  vim.cmd('NvimTreeToggle')    -- Open Nvim Tree
  vim.cmd('wincmd l')          -- Move to the file buffer
  OpenTerminalAtBottom()       -- Open terminal at the bottom
  vim.cmd('wincmd k')          -- Move back to the file buffer
end

-- automatic split for terminal
function OpenTerminalAtBottom()
  vim.cmd('belowright split')
  vim.cmd('resize 10')
  vim.cmd('term zsh')
  vim.cmd('startinsert')
end

vim.api.nvim_set_keymap('n', '<C-w>b', ':lua OpenTerminalAtBottom()<CR>', { noremap = true, silent = true })

-- Map <C-w> in terminal mode to switch to normal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n><C-w>', { noremap = true, silent = true })

-- Set up the IDE layout
vim.api.nvim_create_user_command('SetupIDE', SetupIDELayout, {})
vim.api.nvim_set_keymap('n', '<leader>i', ':SetupIDE<CR>', { noremap = true, silent = true })

-- Lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- orgmode, orgroam
require('orgmode').setup({
    org_agenda_files = '~/.config/nvim/orgfiles/agenda/**/*',
    org_default_notes_file = '~/.config/nvim/orgfiles/refile.org',
})

require("org-roam").setup({
    directory = "~/.config/nvim/orgfiles",
})

-- nabla
vim.api.nvim_set_keymap('n', '<leader>l', ':lua require("nabla").toggle_virt()<CR>', { noremap = true, silent = true })
--require"nabla".enable_virt({
--  autogen = true, -- auto-regenerate ASCII art when exiting insert mode
--  silent = true,     -- silents error messages
--})
