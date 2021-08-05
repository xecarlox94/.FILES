" general settings
set nocompatible
syntax on
filetype plugin on
" filetype on
set encoding=utf-8
set noerrorbells

" cache settings
if !has('nvim')
    set viminfofile=~/.cache/vim/viminfo
    set noswapfile
    set nobackup
    set undodir=~/.cache/vim/undodir
    let g:netrw_home=$XDG_CACHE_HOME.'/vim'
    set undofile
endif

" search settings
set incsearch
set nohlsearch

" wild menu
set wildmenu
set wildmode=list:longest

set splitbelow
set splitright

set number
set relativenumber

set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard+=unnamedplus
set expandtab
set smartindent
set bg=dark
set exrc
set scrolloff=3
set signcolumn=yes
set guicursor=

" cursor lines
" set cursorcolumn
" set cursorline

