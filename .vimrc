<<<<<<< HEAD
let mapleader = " "

" enable syntax highlighting
" syntax on
"
" " theme
" set t_Co=256
" set background=dark
"
" " load plugins
" if filereadable(expand("~/.vimrc.plugins"))
"   source ~/.vimrc.plugins
"   endif
"
"   " required to detect filetype
"   filetype plugin indent on
"
"   set shell=/bin/bash
"
"   " status line
"   set statusline=%f\ %=col:%2c\ line:%2l
"
"   set backspace=2       " make backspace work like most other apps
"   set noswapfile        " don't swap buffer to file
"   set ruler             " show the cursor position all the time
"   set showcmd           " display incomplete commands
"   set incsearch         " do incremental searching
"   set laststatus=2      " always display the status line
"   set history=500       " sets how many lines of history VIM has to remember
"   set nowrap            " don't wrap long lines
"   set wildmenu          " visual autocomplete for command menu
"   set ignorecase        " /the would find 'the' or 'The', add \C if you want 'the' only
"   set smartcase         " while /The would find only 'The' etc.
"   set nopaste           " enable formatting while pasting
"   set pastetoggle=<F2>  " switch paste mode
"   set clipboard=unnamed " yank to and paste the selection without prepending "*
"   set autowrite         " save file before switching a buffer
"   set autoindent        " indent
"   set showmatch         " highlight matching brackets
"   set autoread          " when file was changed
"   set lazyredraw        " redraw only when we need to"
"   set hlsearch          " highlight same words while searching with Shift + *
"
"   " line numbers
"   set number            " show
"   set numberwidth=5     " line numbers width
"
"   " make it obvious where 120 characters is
"   set textwidth=120
"   set colorcolumn=+1
"   set formatoptions+=w " for wraping long lines without broken words
"
"   " spaces
"   set tabstop=2     " tab width
"   set shiftwidth=2  " indent size
"   set softtabstop=2 " simulated tab width
"   set expandtab     " spaces on tab press
"   set smartindent   " indent automatically
"   set shiftround    " uses shiftwidth when >, <
"
"   " map russian keyboard
"   set keymap=russian-jcukenwin
"   set iminsert=0
"   set imsearch=0
"
"   " show whitespaces
"   set list listchars=tab:»·,trail:·
"
"   " removes the delay when hitting esc in insert mode
"   set ttimeout
"   set ttimeoutlen=1
"
"   " disable sound
"   set visualbell t_vb=
"
"   " automatically refresh changed files
"   set autoread
"
"   " highlight trailing whitespaces
"   hi ExtraWhitespace ctermbg=172 guifg=#d78700
"   match ExtraWhitespace /\s\+$/
"
"   " make line number brighter
"   hi LineNr ctermfg=240 guifg=#585858
=======
" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
>>>>>>> 5368015b53467949c36f1e386582ac066b0d0ae6
