" ===============================================================================
"
" 						MY VIMRC
"
" ===============================================================================

call plug#begin('~/.vim/plugged')
"To install plugings
" Pluging for file explorer
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
" colorscheme
Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
" To comment code with gcc
Plug 'tpope/vim-commentary'

"Python autoformating very good one
Plug 'psf/black'
" for code snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc-snippets'
Plug 'SirVer/ultisnips'
" Auto pairs [],{}, ()
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tlib_vim'
" vim fzf finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Languages icons
Plug 'vim-scripts/vim-webdevicons'
Plug 'ryanoasis/vim-devicons'
" For centering text in a nice looking format
Plug 'junegunn/goyo.vim'
" For repeating commends with dot
Plug 'tpope/vim-repeat'
" For changing surrounding like single cote to double cote
Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()
let g:coc_global_extensions = [ 'coc-pyright' ]

" =======================================================================

au! BufWritePost $MYVIMRC source % " Auto source the vimrc

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<TAB>" :
      \ <SID>check_back_space() ? "\<C-n>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
set pumheight=10 "Make popup menu smaller
set pumwidth=15
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `kg` and `jg` to navigate diagnostics
nmap <silent> kg <Plug>(coc-diagnostic-prev)
nmap <silent> jg <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType c,python,cpp setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>f  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR
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
set cindent              "indentation C/C++
set background=dark
colorscheme gruvbox
set tw=80 " with of the document(used by gd)
set nowrap " don't automatically wrap on load
set colorcolumn=80
highlig colorcolumn ctermbg = 233
set nu
set relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	" map <leader>g :Goyo \| set bg=light \| set linebreak<CR>
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

" Avoid Snippets message error while opining it due to version
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:UltiSnipsSnippetsDir = "~/home/balde/nvim/snippets"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:snipMate = { 'snippet_version' : 1 }
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsListSnippets="<c-l>"
" Enable or Disable snipmate snippet expansion.
if !exists("g:UltiSnipsEnableSnipMate")
    let g:UltiSnipsEnableSnipMate = 1
endif

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

"change the title to include the current file
set icon
auto BufEnter * let &iconstring = "vim " . expand("%:t")

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
"" Encoding
" Give more space for displaying messages.
set cmdheight=2
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
set guicursor=
" shw existing tabe with 4 spaces width
set tabstop=4
" when indented with '>' use 4 spaces width
set shiftwidth=4

" On pressing tab insert 4 spaces
set expandtab

set hidden

"" Searching
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
nnoremap <Left>  :echoe "Use h"<CR>

nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Make :e and :vsp show directory relative to buffer
set autochdir
set linespace=8

" To check quality of the code.
let g:ale_linters = {
    \ 'python': ['pylint'],
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
set exrc
set secure

silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c

" Clipboard
 silent! set clipboard=unnamedplus

 " NERDCommenter
 nmap <C-> <Plug>NERDCommenterToggle
 vmap <C-> <Plug>NERDCommenterToggle<CR>gv

 " for NORDTree
 let NERDTreeQuitOnOpen=1
 let NERDTreeMinimalUI=1
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 nnoremap <C-f> :NERDTreeFind<CR>

 " For folding using markdown
 " Folding is enabled for headers by default.
 " The following commands are useful to open and close folds:
let g:vim_markdown_folding_style_pythonic = 1

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

 " For Fuzz Finding  fzf
" use leader + s to search for files in vim
nnoremap <Leader>s :Files<Cr>

" to hide vim status bar
let s:hidden_all = 0
" function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
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
autocmd filetype js nnoremap <F9> :w <bar> exec '!node '.shellescape('%')<CR>

" Filetype specific commands
augroup filtypes
    autocmd!
    autocmd FileType c,cpp setlocal comments^=:///
    autocmd FileType c,cpp setlocal commentstring=///\ %s
    autocmd FileType crontab setlocal nobackup nowritebackup
    autocmd FileType make setlocal noexpandtab
augroup end
