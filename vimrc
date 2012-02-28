" Get this config with "source ~/.conf/vimrc"

" ****************************************************************************
" Program Behaviour
" ****************************************************************************
" http://jmcpherson.org/vimrc.html 
" http://code.google.com/p/fizz-buzz/source/browse/trunk/misc/home_directory/.vimrc

" Enable syntax highlighting
syntax on
" disable vi-compatibility
set nocompatible
" files to ignore
set wildignore=*.o,*.lo,*.la,#*#,.*.rej,*.rej,.*~,*~,.#*,*.class,*.pyc
" disable backup files
set nobackup
set nowritebackup
" turn off GUI toolbar
set guioptions-=T
" highlight search terms
set nohlsearch
" ic: ignore case for searching
set ignorecase
" default to incremental search with /
set incsearch
" enable mouse (disables terminal copy in non-gui vim)
set mouse=a
" show ruler
set ruler
" scs: only ignore case if search is all lower case
set smartcase
" show what is being done
set showcmd
" sm: briefly show matching parenthesis
set showmatch
" smd: show me when I'm doing something
set showmode
" turn off beeps
set vb t_vb=
" enhanced command-line completion
set wildmenu

" ****************************************************************************
" Indentation and wrapping
" ****************************************************************************
" http://vim.wikia.com/wiki/Indenting_source_code
" Use :le2 to left-align the selected block of text in column 2

" ft: Indent plugin files
filetype plugin indent on
" ai: maintain indentation level on new line
set autoindent
" bs: sensible backspace operation
set backspace=indent,eol,start
" et: insert softtabstop spaces when pressing <TAB>
set expandtab
" nw: turn off line wrapping by default
set nowrap
" sr: only indent to nearest tab stop
set shiftround
" si: insert extra indentation in C-style blocks
set smartindent
" sw: number of spaces for << >> ===
set shiftwidth=4
" ts: width of <TAB> character
set tabstop=4
" sts: number spaces inserted with <TAB>
set softtabstop=4
" tw: line wrapping width
set textwidth=30000
" prevent # comments going to column 0 like a C preprocessor
inoremap # X<BS>#
set cinkeys-=0#
set indentkeys-=0#

" ****************************************************************************
" Insert Mode Mappings
" ****************************************************************************

" C-space (and c-2) to toggle insert mode
nnoremap <c-@> i
imap <c-@> <Esc>

" c-{dw} to delete characters/words in insert mode
imap <c-d> <c-o>x
imap <c-w> <c-o>dw

" c-{q} to kill to end of line in insert mode
imap <c-q> <c-o>D

" c-{jklh} or c-{npfb} to move cursor down/up/right/left in insert mode
imap <c-j> <c-o>j
imap <c-n> <c-o>j
imap <c-k> <c-o>k
imap <c-p> <c-o>k
imap <c-l> <c-o>l
imap <c-f> <c-o>l
imap <c-h> <c-o>h
imap <c-b> <c-o>h

" c-{ea} to move to the end/beginning of line in insert mode
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" c-{z} to undo in insert mode
" (c-u in deletes inserted characters)
imap <c-z> <c-o>u

" c-w,{kjlh} to navigate screens in insert mode
imap <c-w>k <c-o><c-w>k
imap <c-w>j <c-o><c-w>j
imap <c-w>l <c-o><c-w>l
imap <c-w>h <c-o><c-w>h

" ****************************************************************************
" Normal and Visual mode mappings
" ****************************************************************************
" map = Normal Mode and Visual Modes
" imap = Insert Mode, cmap = Command-Line Mode, nmap = Normal Mode

" save file
map <c-x>w :w<cr>
map <c-x><c-w> :w<cr>
" toggle paste mode (normal, visual, insert and command mode)
set pastetoggle=<c-x>p
" toggle wrapping
map <c-x>n :set nowrap!<cr>

" ****************************************************************************
" Auto Commands
" ****************************************************************************

" Python setup
if !exists("py_autocommands_loaded")
  let py_autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source $HOME/.vim/vimpython
endif

" Python smartindent settings
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Less CSS settings (uses ~/.vimrc/syntax/less.vim)
autocmd BufNewFile,BufRead *.less set filetype=less softtabstop=4 tabstop=4 shiftwidth=4

" HTML indent settings
autocmd BufRead *.html set softtabstop=1 tabstop=1 shiftwidth=1

" CoffeeScript indent settings
autocmd BufRead *.coffee set softtabstop=4 tabstop=4 shiftwidth=4

" CoffeeScript indent settings
autocmd BufRead *.markdown set softtabstop=4 tabstop=4 shiftwidth=4

" Compile CoffeeScript on save (fails silently if coffee not found)
autocmd BufWritePost,FileWritePost *.coffee :silent !coffee -c <afile>

" Compile LessCSS on save (fails silently if lessc not found)
autocmd BufWritePost,FileWritePost *.less :silent !lessc <afile> <afile>:r.css

" Jump to last position when re-opening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Single-space indent in zencoding
let g:user_zen_settings = {
\  'indentation' : ' '
\}

