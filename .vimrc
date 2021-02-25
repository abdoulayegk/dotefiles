set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized
"
set number
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

" Quicksave command
noremap <C-Z> : update<CR>
vnoremap <C-Z> <C-C>:update<CR>
noremap <C-Z> <C-O>:update<CR>

"Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

"Let vimrc configuration changes take effect immediately'
 autocmd BufWritePost $MYVIMRC  source  $MYVIMRC

 " remember cursor positions
set viminfo='25,\"50,n~/.viminfo

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

" Status bar formatting
set statusline=[%n]%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set list listchars=tab:▸\ ,trail:·

set fileformats=unix,dos,mac

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

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



" For making fold
"augroup vimrc
 " au BufReadPre * setlocal foldmethod=indent
  "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
  "augroup END
 "  set foldmethod=manual
set lazyredraw
set laststatus=2
set noshowmode
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store

 " This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This oomakes searching more convenient.
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
