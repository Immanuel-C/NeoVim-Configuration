vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

map("n", "<C-s>", "<Cmd>w<CR>", opts)
map("n", "<leader>sn", "<Cmd>noautocmd w <CR>", opts) -- Save with no format

map("n", "x", "\"_x", opts)

map("t", "<C-x>", "<C-\\><C-n>")

-- Resize with arrows
map('n', '<Up>', ':resize +2<CR>', opts)
map('n', '<Down>', ':resize -2<CR>', opts)
map('n', '<Left>', ':vertical resize -2<CR>', opts)
map('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer

-- Window management
map('n', '<leader>v', '<C-w>v', opts) -- split window vertically
map('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
map('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
map('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
map('n', '<S-k>', ':wincmd k<CR>', opts)
map('n', '<S-j>', ':wincmd j<CR>', opts)
map('n', '<S-h>', ':wincmd h<CR>', opts)
map('n', '<S-l>', ':wincmd l<CR>', opts)


map('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
map('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
map('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
map('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Keep the last yanked text even when pasting
map('v', 'p', '"_dP', opts)

-- LSP
map("n", "<leader>df", vim.diagnostic.open_float, opts)
