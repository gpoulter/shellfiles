" ****************************************************************************
" Program Behaviour
" ****************************************************************************

" disable vi-compatibility
set nocompatible
" ignore case for searching
set ignorecase
" only ignore case if search is all lower cas
set smartcase
" textwidth to 256
set tw=256
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

" enable mouse
set mouse=a
" show what is being done
set showcmd
" highlight search
set nohlsearch
" show me when I'm doing something
set showmode
" show me how the search is doing
set incsearch
" show a ruler
set ruler
" briefly show matching parenthesis
set showmatch
" default to incremental search with /
set incsearch
" turn off annoying beets
set vb t_vb=
" turn off annoying GUI toolbar
set guioptions-=T
" enhanced command-line completion
set wildmenu

" ****************************************************************************
" Indentation
" ****************************************************************************

" http://vim.wikia.com/wiki/Indenting_source_code
" Use :le2 to left-align the selected block of text in column 2

" insert spaces when pressing <TAB>
set expandtab
" number of spaces for << >> ===
set shiftwidth=4
" number spaces inserted with <TAB>
set softtabstop=4
" only indent to nearest tab stop
set shiftround
" sensible backspace operation
set backspace=indent,eol,start
" maintain indentation level on new line
set autoindent
" insert extra indentation in C-style blocks
set smartindent
" Python smartindent settings
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" disable #-comments going to column 0 (preprocessor indent)
inoremap # X<BS>#
set cinkeys-=0#
set indentkeys-=0#

" ****************************************************************************
" Insert Mode Mappings
" ****************************************************************************

" C-space (and c-2) toggles insert mode
nnoremap <c-@> i
imap <c-@> <Esc>

" c-d deletes characters 
imap <c-d> <c-o>x

" c-q kill to end of line
imap <c-f> <c-o>D

" c-{jklh} moves cursor in insert mode
imap <c-j> <c-o>j
imap <c-k> <c-o>k
imap <c-l> <c-o>l
imap <c-h> <c-o>h

" c-e moves to the end of a line
imap <c-e> <c-o>$

" c-a moves to the beginning of a line
imap <c-a> <c-o>^

" c-z undoes what you just did
" (c-u in deletes inserted characters)
imap <c-z> <c-o>u

" Navigate screens in insert mode
imap <c-w>k <c-o><c-w>k
imap <c-w>j <c-o><c-w>j
imap <c-w>l <c-o><c-w>l
imap <c-w>h <c-o><c-w>h

" ****************************************************************************
" Normal/Visual mode mappings
" ****************************************************************************
" map = Normal + Visual
" imap = Insert
" cmap = Command-Line

" Windows-style save shortcut
map <F6> :w<cr>
imap <F6> <c-o>:w<cr>
map <c-s> :w<cr>

" Toggle paste
set pastetoggle=<F6>

" For editing long lines
map <F8> :set tw=30000<cr>

" Execute a subshell
nmap <F9> :sh<cr>

" Space/Backspace for paging
nmap <Space> <c-f>
nmap <Backspace> <c-b>

" Python setup
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" Remember last edit position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
