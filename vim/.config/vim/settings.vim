" FIXES
set noerrorbells
set clipboard+=unnamedplus
set smartindent
set scrolloff=3
set guicursor=


" GENERAL
set nocompatible
set spelllang=en_gb
syntax on
set encoding=utf-8
set bg=dark


" BUILT-IN PLUGINS
filetype plugin indent on
" filetype on


" CACHE
set noswapfile
set nobackup
if !has('nvim')
    " set viminfofile=~/.cache/vim/viminfo
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" CURSOR LINES
" set cursorcolumn
" set cursorline


set hidden
set exrc
" set signcolumn=yes
