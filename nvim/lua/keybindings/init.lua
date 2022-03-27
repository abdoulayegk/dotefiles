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

--> barbar mappings <--
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", ":BufferMoveNext<CR>", opts)
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<C-p>", ":BufferPick<CR>", opts)
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)
--> nabla
map("n", "<C-r>", ':lua require("nabla").action()<CR>', opts)
map("n", "<C-p>", ':lua require("nabla").popup()<CR>', opts)

--> diagnostics
map('n', '<Leader>g', ':ToggleDiag<CR>', { noremap = true, silent = true })
map("n", "<leader>du", "<Plug>(toggle-lsp-diag-underline)", {silent = true })
map("n", "<leader>ds", "<Plug>(toggle-lsp-diag-signs)", {silent = true })
map("n", "<leader>dv", "<Plug>(toggle-lsp-diag-vtext)", {silent = true })
map("n", "<leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)", {silent = true })



