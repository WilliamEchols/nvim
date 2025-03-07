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
opt.updatetime = 250     -- Faster completion (default 4000ms)
opt.timeoutlen = 300     -- Time to wait for mapped sequence to complete

-- Visual Enhancements
opt.cursorline = true    -- Highlight current line
opt.termguicolors = true -- True color support
opt.scrolloff = 8        -- Lines of context
opt.sidescrolloff = 8    -- Columns of context
opt.mouse = "a"          -- Enable mouse support

-- Tabs & indentation
opt.tabstop = 2          -- 2 spaces for tabs
opt.shiftwidth = 2       -- 2 spaces for indent width
opt.expandtab = true     -- Use spaces instead of tabs
opt.smartindent = true   -- Smart indenting
opt.wrap = true          -- Line wrap

-- Search
opt.hlsearch = true      -- Highlight search results
opt.incsearch = true     -- Show search matches as you type

-- Window splitting
opt.splitright = true    -- Vertical splits to the right
opt.splitbelow = true    -- Horizontal splits below

-- File handling
opt.autowrite = true     -- Auto save before commands like :next and :make
opt.hidden = true        -- Enable modified buffers in background

-- Water spray
vim.keymap.set('n', '<Up>', function() vim.notify("Use k instead!", vim.log.levels.WARN) end, { noremap = true })
vim.keymap.set('n', '<Down>', function() vim.notify("Use j instead!", vim.log.levels.WARN) end, { noremap = true })
vim.keymap.set('n', '<Left>', function() vim.notify("Use h instead!", vim.log.levels.WARN) end, { noremap = true })
vim.keymap.set('n', '<Right>', function() vim.notify("Use l instead!", vim.log.levels.WARN) end, { noremap = true })
