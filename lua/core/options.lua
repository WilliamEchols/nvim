local opt = vim.opt

-- Sensible defaults
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.showmode = false     -- Don't show mode (handled by statusline later)
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.breakindent = true    -- Indent wrapped lines
opt.undofile = true      -- Persistent undo
opt.ignorecase = true    -- Case insensitive searching
opt.smartcase = true     -- Case sensitive when capitals used
opt.signcolumn = "yes"   -- Always show sign column
opt.updatetime = 0 --- 250     -- Faster completion
opt.timeoutlen = 0 --- 300     -- Faster mapping timeout

-- Tabs & indentation
opt.tabstop = 2          -- 2 spaces for tabs
opt.shiftwidth = 2       -- 2 spaces for indent width
opt.expandtab = true     -- Use spaces instead of tabs
opt.smartindent = true   -- Smart indenting

-- Window splitting
opt.splitright = true    -- Vertical splits to the right
opt.splitbelow = true    -- Horizontal splits below

-- Water spray
vim.keymap.set('n', '<Up>', function() vim.notify("Use k instead!", vim.log.levels.WARN) end, { noremap = true })
vim.keymap.set('n', '<Down>', function() vim.notify("Use j instead!", vim.log.levels.WARN) end, { noremap = true })
vim.keymap.set('n', '<Left>', function() vim.notify("Use h instead!", vim.log.levels.WARN) end, { noremap = true })
vim.keymap.set('n', '<Right>', function() vim.notify("Use l instead!", vim.log.levels.WARN) end, { noremap = true })
