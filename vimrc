" Get this config with "source ~/.conf/vimrc"

" ****************************************************************************
" Program Behaviour
" ****************************************************************************

" disable vi-compatibility
set nocompatible
" files to ignore
set wildignore=*.o,*.lo,*.la,#*#,.*.rej,*.rej,.*~,*~,.#*,*.class,*.pyc
" disable backup files
set nobackup
set nowritebackup

" Jump to last position when re-opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ****************************************************************************
" Visual Behaviour/Appearance
" ****************************************************************************

" http://jmcpherson.org/vimrc.html 
" http://code.google.com/p/fizz-buzz/source/browse/trunk/misc/home_directory/.vimrc

" turn off annoying GUI toolbar
set guioptions-=T
" highlight search
set nohlsearch
" ignore case for searching
set ignorecase
" default to incremental search with /
set incsearch
" enable mouse
set mouse=a
" show a ruler
set ruler
" only ignore case if search is all lower case
set smartcase
" show what is being done
set showcmd
" briefly show matching parenthesis
set showmatch
" show me when I'm doing something
set showmode
" turn off annoying beets
set vb t_vb=
" enhanced command-line completion
set wildmenu

" ****************************************************************************
" Indentation and wrapping
" ****************************************************************************

" http://vim.wikia.com/wiki/Indenting_source_code
" Use :le2 to left-align the selected block of text in column 2

" maintain indentation level on new line
set autoindent
" sensible backspace operation
set backspace=indent,eol,start
" insert spaces when pressing <TAB>
set expandtab
" turn off line wrapping by default
set nowrap
" only indent to nearest tab stop
set shiftround
" number of spaces for << >> ===
set shiftwidth=4
" insert extra indentation in C-style blocks
set smartindent
" number spaces inserted with <TAB>
set softtabstop=4

" disable #-comments going to column 0 (preprocessor indent)
inoremap # X<BS>#
set cinkeys-=0#
set indentkeys-=0#
" Python smartindent settings
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

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
" imap = Insert Mode
" cmap = Command-Line Mode
" nmap = Normal Mode

" F6 to save file
map <F6> :w<cr>
" F7 to toggle paste mode (normal, visual, insert and command mode)
set pastetoggle=<F7>
" F8 to toggle wrapping
map <F8> :set nowrap!<cr>
" F9 to execute a subshell
nmap <F9> :sh<cr>
" Space/Backspace to page forward/back
nmap <Space> <c-f>
nmap <Backspace> <c-b>

" Python setup
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source $CONF/vimpython
endif

