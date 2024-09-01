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

" File changed
set autoread
" au FocusGained,BuffEnter * silent! checktime


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
" set signcolumn=yes

" Netrw plugin
if !has('nvim')
    set autochdir
endif

let g:netrw_banner = 0
let g:netrw_list_hide= '^\.\./$,^\./$'
let g:netrw_hide = 1
let g:netrw_sizestyle= "h"

"-------------------- MAPPINGS

let mapleader=','
let g:mapleader=','


" Run
nnoremap <Leader>rp :<up><CR>


" change local settings
nnoremap <Leader>ls :setlocal spell!<CR>
nnoremap <Leader>lw :setlocal nowrap!<CR>

" Window
nnoremap <Leader>w- :split<CR>
nnoremap <Leader>wi :vsplit<CR>
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>7 <C-w><
nnoremap <Leader>8 <C-w>-
nnoremap <Leader>9 <C-w>+
nnoremap <Leader>0 <C-w>>


" File
nnoremap <Leader>fw :w<CR>
nnoremap <Leader>fx :x<CR>
nnoremap <Leader>fq :q<CR>
nnoremap <Leader>fk :q!<CR>
" nnoremap <Leader>fp :r !xclip -o<CR>
" vnoremap <Leader>fy :w !xclip -sel clip<CR><CR>


" Explore - navigation
nnoremap <Leader>n :Ex<CR>

" Tab
nnoremap <Leader>tn :tabNext<CR>
nnoremap <Leader>to :tabnew<Space>
nnoremap <Leader>tp :tabprevious<CR>

" Open
nnoremap <Leader>of :e<Space>
nnoremap <Leader>os :shell<CR>
nnoremap <Leader>ot :vert ter<CR>
nnoremap <Leader>ob :buffers<CR>:b<Space>


augroup netrw_setup | au!
    au FileType netrw nmap <buffer> l <CR>
    au FileType netrw nmap <buffer> h -
    au FileType netrw nmap <buffer> f %
augroup END


"-------------------- AUTO COMMANDS


" add it as map
" removing all white spaces
autocmd BufWritePre * %s/\s\+$//e


" updating X11 configs
autocmd BufWritePost ~/.config/.FILES/vim/.config/vim/init.vim so %
autocmd BufWritePost ~/.Xresources,~/Xdefaults !xrdb %

autocmd BufWritePost ~/.bashrc !source %



"-------------------- MOVE TO SETTINGS
"
"
" work on colorscheme solution for vim and neovim


if !has('nvim')
    colorscheme desert
    " colorscheme ron
    " colorscheme torte
    " colorscheme elflord
    " colorscheme industry
endif

