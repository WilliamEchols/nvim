local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Split windows
map("n", "<leader>wr", ":vsplit<CR>", { desc = "Split [w]indow [r]ight" })
map("n", "<leader>wb", ":split<CR>", { desc = "Split [w]indow [b]ottom" })

-- Bottom terminal
map("n", "<leader>tb", ":botright term<CR>", { desc = "Open [t]erminal [b]ottom" })

-- Buffer navigation (alternative to telescoping buffer)
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Visual mode indent
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true, desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Close tab' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true, desc = 'Close other tabs' })
vim.keymap.set('n', '<tab>', ':tabnext<CR>', { noremap = true, silent = true, desc = 'Next tab' })
vim.keymap.set('n', '<S-tab>', ':tabprevious<CR>', { noremap = true, silent = true, desc = 'Previous tab' })

-- Snippets
