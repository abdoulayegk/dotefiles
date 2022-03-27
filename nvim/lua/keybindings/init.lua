local opt = vim.opt         		-- global/buffer/windows-scoped options
local GLOBAL = vim.g
local opt = vim.opt         		-- global/buffer/windows-scoped options
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})

map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
    {noremap = true, silent = true})
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
    {noremap = true, silent = true})
--> added code
map('n', '<Leader>g', ':ToggleDiag<CR>', { noremap = true, silent = true })

--> Markdown preview settings
map('n', '<Leader>m', ':MarkdownPreview<CR>', {noremap = true})

--> Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("i", "jj", "<ESC>", opts)



