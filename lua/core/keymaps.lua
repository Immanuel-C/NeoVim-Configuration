vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

DEFAULT_MAP_OPTS = { noremap = true, silent = true }

map("n", "<C-s>", "<Cmd>w<CR>", DEFAULT_MAP_OPTS)
map("n", "<leader>sn", "<Cmd>noautocmd w <CR>", DEFAULT_MAP_OPTS) -- Save with no format

map("n", "x", "\"_x", DEFAULT_MAP_OPTS)

map("t", "<C-x>", "<C-\\><C-n>")

-- Resize with arrows
map('n', '<Up>', ':resize +2<CR>', DEFAULT_MAP_OPTS)
map('n', '<Down>', ':resize -2<CR>', DEFAULT_MAP_OPTS)
map('n', '<Left>', ':vertical resize -2<CR>', DEFAULT_MAP_OPTS)
map('n', '<Right>', ':vertical resize +2<CR>', DEFAULT_MAP_OPTS)

-- Buffers
map('n', '<Tab>', ':bnext<CR>', DEFAULT_MAP_OPTS)
map('n', '<S-Tab>', ':bprevious<CR>', DEFAULT_MAP_OPTS)
map('n', '<leader>x', ':bdelete!<CR>', DEFAULT_MAP_OPTS) -- close buffer

-- Window management
map('n', '<leader>v', '<C-w>v', DEFAULT_MAP_OPTS) -- split window vertically
map('n', '<leader>h', '<C-w>s', DEFAULT_MAP_OPTS) -- split window horizontally
map('n', '<leader>se', '<C-w>=', DEFAULT_MAP_OPTS) -- make split windows equal width & height
map('n', '<leader>xs', ':close<CR>', DEFAULT_MAP_OPTS) -- close current split window

-- Navigate between splits
map('n', '<S-k>', ':wincmd k<CR>', DEFAULT_MAP_OPTS)
map('n', '<S-j>', ':wincmd j<CR>', DEFAULT_MAP_OPTS)
map('n', '<S-h>', ':wincmd h<CR>', DEFAULT_MAP_OPTS)
map('n', '<S-l>', ':wincmd l<CR>', DEFAULT_MAP_OPTS)


map('n', '<leader>to', ':tabnew<CR>', DEFAULT_MAP_OPTS) -- open new tab
map('n', '<leader>tx', ':tabclose<CR>', DEFAULT_MAP_OPTS) -- close current tab
map('n', '<leader>tn', ':tabn<CR>', DEFAULT_MAP_OPTS) --  go to next tab
map('n', '<leader>tp', ':tabp<CR>', DEFAULT_MAP_OPTS) --  go to previous tab

-- Stay in indent mode
map('v', '<', '<gv', DEFAULT_MAP_OPTS)
map('v', '>', '>gv', DEFAULT_MAP_OPTS)

-- Keep the last yanked text even when pasting
map('v', 'p', '"_dP', DEFAULT_MAP_OPTS)

-- LSP
map("n", "<leader>df", vim.diagnostic.open_float, DEFAULT_MAP_OPTS)

-- Avante
map( "n", "<leader>a", "<Cmd>AvanteToggle<Cr>", DEFAULT_MAP_OPTS )
