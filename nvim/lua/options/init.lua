local set = vim.opt
local opt = vim.opt         		-- global/buffer/windows-scoped options
local cmd = vim.cmd     				-- execute Vim commands


-- set.shell = "/bin/sh"

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.autoindent = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 9
set.fileencoding = "utf-8"
set.conceallevel = 2

set.relativenumber = true
set.number = true
-- set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"

set.updatetime=300

opt.colorcolumn = '80'        -- line lenght marker at 80 columns

-- vim.notify = require("notify")
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]


-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.smartindent = true                -- make indenting smarter again
vim.o.fileformat = vim.bo.fileformat
--
-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

vim.g.python3_host_prog = '/usr/bin/python3'
vim.opt.exrc = true
------------------------------------------------------------------------------>
