" ==============================================================================
"                                  MY VIMRC
" ============================== Vim-Plug ======================================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))


" ===============================================================================

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
" colorscheme
Plug 'morhetz/gruvbox'
" To comment code with gcc
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
"Python autoformating very good one
Plug 'psf/black'
" for code snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" Auto pairs [],{}, ()
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tlib_vim'
" vim fzf finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" For repeating commends with dot
Plug 'tpope/vim-repeat'
" For changing surrounding like single cote to double cote
Plug 'tpope/vim-surround'
Plug 'mhartington/formatter.nvim'

" Code formatting (for c++)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

"=============================================================================
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating
" Initialize plugin system
call plug#end()



" ===============================================================================
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
syntax enable
syntax on
syntax enable
set updatetime=300
set timeoutlen=500 " Fast saving
set scrolloff=8
set cindent              "indentation C/C++
" set background=dark
colorscheme gruvbox
set tw=80 " with of the document(used by gd)
set nowrap " don't automatically wrap on load
set colorcolumn=80
highlig colorcolumn ctermbg = 233
set nu
set relativenumber
" Quicksave command
noremap <C-Z> : update<CR>
vnoremap <C-Z> <C-C>:update<CR>
noremap <C-Z> <C-O>:update<CR>

"Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>
noremap <Leader>h :noh<CR>
inoremap jj <Esc>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
" Hide the status bar of vim
let s:hidden_all = 0
let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set guicursor=
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set nohlsearch
set incsearch
set ignorecase
set smartcase
set signcolumn=yes
set showcmd
set shell=/bin/sh
set fo+=w
cmap w!! %!sudo tee > /dev/null %
set title
set titleold="Terminal"
set titlestring=%F
set nobackup
set nowb
set noswapfile
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set fileformats=unix,dos,mac
" Enable mouse support. You should avoid relying on this too much, but it can
set mouse+=a
set scrolloff=7
set ignorecase
set smartcase
nnoremap <Left>  :echoe "Use h"<CR>
 " Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
"" After searching, pressing escape stops the highlight
nnoremap <silent> <esc> :noh<cr><esc>

" Open nvimrc file
nnoremap <Leader>v :vsp $MYVIMRC<CR>
set completeopt=menuone,noselect
let g:snipMate = { 'snippet_version' : 1 }

" Source nvimrc file
au! BufWritePost $MYVIMRC source % " Auto source the vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>s :Files<Cr> " FZF finder

" ============================Linting and code formating========================

let g:ale_linters = {
    \ 'python': ['black'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['black'],
      \   'javascript': ['eslint'],
      \}
autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>
let g:ale_fix_on_save = 1
" TO enable virtual evironment python
let g:python3_host_prog='/usr/bin/python3'

" Code formatting
autocmd FileType c,cpp,,javascript AutoFormatBuffer clang-format

" =========================================================================

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)

"=========================set up lsp ============================================
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
" For c/cpp code formating
lua << EOF
require'lspconfig'.ccls.setup{}
EOF


"=============================Run your code with F9 +===========================
autocmd filetype python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F9> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype js nnoremap <F9> :w <bar> exec '!node '.shellescape('%')<CR>

" ======================== NERDTree  ==============================================
 let NERDTreeQuitOnOpen=1
 let NERDTreeMinimalUI=1
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 nnoremap <C-f> :NERDTreeFind<CR>
