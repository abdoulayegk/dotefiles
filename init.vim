call plug#begin('~/.vim/plugged')

"To install plugings
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'psf/black'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tlib_vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Initialize plugin system
call plug#end()

" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" colorscheme
syntax enable
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
inoremap jj <Esc>

" remember cursor positions
set viminfo='25,\"50,n~/.viminfo

let g:snipMate = { 'snippet_version' : 1 }

"change the title to include the current file
set icon
auto BufEnter * let &iconstring = "vim " . expand("%:t")

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" Hide the status bar of vim
let s:hidden_all = 0
let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd

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

" Status bar formatting
set statusline=[%n]%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set list listchars=tab:▸\ ,trail:·

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
      \   'ruby': ['standardrb', 'rubocop'],
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

" for running the scrip in the terminal by just pressing F9 for python and go

 augroup rungroup
     autocmd!
     autocmd BufRead,BufNewFile *.go nnoremap <F9> :exec '!go run' shellescape(@%, 1)<cr>
     autocmd BufRead,BufNewFile *.py nnoremap <F9> :exec '! clear; python' shellescape(@%, 1)<cr>
 augroup END

 " To execute C programming code using F5 key
 map <F8> : ! clear; gcc % && ./a.out <CR>
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

 " zr: reduces fold level throughout the buffer
 " zR: opens all folds
 " zm: increases fold level throughout the buffer
 " zM: folds everything all the way
 " za: open a fold your cursor is on
 " zA: open a fold your cursor is on recursively
 " zc: close a fold your cursor is on
 " zC: close a fold your cursor is on recursively

 " For Fuzz Finding  fzf
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>f :Files<Cr>


" press F9 to compile and run c++ code
map <F9> :!clear; g++ -g % -o %:r && ./%:r <CR>
map <F5> :!g++ -g % -o %:r <CR>

" for cpp autoformating

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
" endfunction

" nnoremap <S-h> :call ToggleHiddenAll()<CR>
" Alway enable preview window on the right with 60% width

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
