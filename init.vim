call plug#begin('~/.vim/plugged')

"To install plugings
" Pluging for file explorer
Plug 'preservim/nerdtree'
" colorscheme
Plug 'altercation/vim-colors-solarized'
" To comment code using gcc
Plug 'tpope/vim-commentary'
"Python autoformating very good one
Plug 'psf/black'
" fzf finder
Plug 'ctrlpvim/ctrlp.vim'
" for code snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" Auto pairs [],{}, ()
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tlib_vim'
" vim fzf finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Languages icons
Plug 'ryanoasis/vim-devicons'
" For centering text in a nice looking format
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" colorscheme
syntax enable
syntax on
set cindent              "indentation C/C++
set background=dark
colorscheme solarized
set tw=80 " with of the document(used by gd)
set nowrap " don't automatically wrap on load
set colorcolumn=80
highlig colorcolumn ctermbg = 233
" To Keep lines to less than 80 characters
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set relativenumber
" to solve pylint
" autocmd BufWritePost *.py call Flake8()
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>g :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
" while in insert mode, moves you to the end of the next line when you type
imap ;ne <esc>/;<cr>a
imap jj <Esc>

" Quicksave command
noremap <C-Z> : update<CR>
vnoremap <C-Z> <C-C>:update<CR>
noremap <C-Z> <C-O>:update<CR>

"Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>
noremap <Leader>h :noh<CR>
inoremap jj <Esc>

" remember cursor positions
set viminfo='25,\"50,n~/.viminfo

let g:snipMate = { 'snippet_version' : 1 }
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-l>"


"change the title to include the current file
set icon
auto BufEnter * let &iconstring = "vim " . expand("%:t")

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
"" Encoding
set encoding=UTF-8

set fileencodings=utf-8
set ttyfast

" Hide the status bar of vim
let s:hidden_all = 0
let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd
" shw existing tabe with 4 spaces width
set tabstop=4
" when indented with '>' use 4 spaces width
set shiftwidth=4

" On pressing tab insert 4 spaces
set expandtab

set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showcmd
set shell=/bin/sh
set fo+=w
cmap w!! %!sudo tee > /dev/null %
set title
set titleold="Terminal"
set titlestring=%F
" Turn backup off, since most stuff is in SVN, git et.c anyway...
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
" sometimes be convenient.
set mouse+=a
set scrolloff=7
set ignorecase
set smartcase
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>

nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Make :e and :vsp show directory relative to buffer
set autochdir

set linespace=8

" To check quality of the code.
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}


let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['black'],
      \   'javascript': ['eslint'],
      \}
autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>
let g:ale_fix_on_save = 1
set exrc
set secure

silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c

" Clipboard
 silent! set clipboard=unnamed,unnamedplus
 nnoremap <C-n> :NERDTree<CR>

 " for NORDTree
 nnoremap <leader>n :NERDTreeFocus<CR>
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 nnoremap <C-f> :NERDTreeFind<CR>

 " For folding using markdown
 " Folding is enabled for headers by default.
 " The following commands are useful to open and close folds:
let g:vim_markdown_folding_style_pythonic = 1

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

 " For Fuzz Finding  fzf
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" use leader + f to search for files in vim
nnoremap <Leader>f :Files<Cr>

" to hide vim status bar
let s:hidden_all = 0
" function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    " else
        " let s:hidden_all = 0
        " set showmode
        " set ruler
        " set laststatus=2
        " set showcmd
    endif

" TO enable virtual evironment python
let g:python3_host_prog='/usr/bin/python3'

" To move easily between tabs using leader
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Run code using F9
autocmd filetype python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F9> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
