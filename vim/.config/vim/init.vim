"-------------------- SETTINGS

" FIXES
set noerrorbells
set visualbell
set t_vb=
set tm=500
set clipboard+=unnamedplus
set smartindent
"set autoindent
set smartcase
set ignorecase
set nowrap
set scrolloff=1
set guicursor=
set timeoutlen=10
set fileencoding=utf8

" macros
set lazyredraw

" search
set regexpengine=0
set magic

" brackets
set showmatch
set mat=2

" GENERAL
set nocompatible
set spelllang=en_gb
set encoding=utf-8
set bg=dark
set hid
set ffs=unix,dos,mac
set smarttab

" Backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" BUILT-IN PLUGINS
filetype plugin indent on
syntax on
" set path+=**


" CACHE
set noswapfile
set nobackup
set nowb
set history=5000
if !has('nvim')
    set viminfofile=~/.cache/vim/viminfo
    set undodir=~/.cache/vim/undodir
    let g:netrw_home=$XDG_CACHE_HOME.'/vim'
    set undofile
endif

" SEARCH SETTINGS
set incsearch
set nohlsearch


" WILD MENU
set wildmenu
set wildmode=list:longest


" WINDOW SPLITS
set splitbelow
set splitright


" NUMBERS
set number
set relativenumber


" TABS
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hidden
set exrc



" Netrw plugin
let g:netrw_banner = 0
let g:netrw_list_hide= '^\.\./$,^\./$'
let g:netrw_hide = 1
let g:netrw_sizestyle= "h"

augroup netrw_setup | au!
    au FileType netrw nmap <buffer> l <CR>
    au FileType netrw nmap <buffer> h -
    au FileType netrw nmap <buffer> f %
augroup END

autocmd BufWritePre * %s/\s\+$//e
