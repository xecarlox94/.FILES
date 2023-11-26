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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set hidden
set exrc
" set signcolumn=yes


"-------------------- MAPPINGS

let mapleader = " "


" Sudo edit
cnoremap W w !sudo tee > /dev/null %<CR>

" Escape mapping
inoremap ,. <Esc>


" change local settings
nnoremap <leader>ls :setlocal spell!<CR>
nnoremap <leader>lw :setlocal nowrap!<CR>

" Window
nnoremap <leader>w- :split<CR>
nnoremap <leader>wi :vsplit<CR>
nnoremap <leader>ww <C-w>w
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>7 <C-w><
nnoremap <leader>8 <C-w>-
nnoremap <leader>9 <C-w>+
nnoremap <leader>0 <C-w>>



" nnoremap <leader>wq <C-w>wq

" File
nnoremap <leader>fw :w<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fx :x<CR>
nnoremap <leader>fk :q!<CR>
nnoremap <leader>fp :r !xclip -o<CR>
" vnoremap <leader>fy :w !xclip -sel clip<CR><CR>


" Open
nnoremap <leader>of :e<Space>
nnoremap <leader>os :shell<CR>
nnoremap <leader>ot :vert ter<CR>
nnoremap <leader>ob :buffers<CR>:b<Space>

" Tab
nnoremap <leader>tn :tabNext<CR>
nnoremap <leader>to :tabnew<Space>
nnoremap <leader>tp :tabprevious<CR>

" Run
nnoremap <leader>rp :<up><CR>
nnoremap <leader>rs :!
vnoremap <leader>rn :norm<Space>

" pairing operators
iabb " ""<left>
iabb ' ''<left>
iabb ( ()<left>
iabb { {}<left>
iabb [ []<left>


" Deprecated
" " insert snippets
" inoremap ,a <Esc>A
" inoremap ,e <Esc>ea
" inoremap ,w <Esc>wi
" inoremap ,b <Esc>bi
" inoremap ,O <Esc>O
" inoremap ,o <Esc>o
" inoremap ,; <Esc>A;
" inoremap ,: <Esc>A:
" inoremap ,, <Esc>A,


"-------------------- AUTO COMMANDS


" add it as map
" removing all white spaces
autocmd BufWritePre * %s/\s\+$//e



" updating X11 configs
autocmd BufWritePost ~/.config/vim/init.vim,~/.config/.FILES/vim/.config/vim/init.vim so %
autocmd BufWritePost ~/.Xresources,~/Xdefaults !xrdb %

autocmd BufWritePost ~/.bashrc !source %




"-------------------- MOVE TO SETTINGS
"
"
" work on colorscheme solution for vim and neovim


colorscheme desert
" colorscheme ron
" colorscheme torte
" colorscheme elflord
" colorscheme industry



"-------------------- Programming Languages


" autocmd FileType go
autocmd FileType go inoremap if<space>err if err != nil {<CR>}<Esc><<<<Oreturn<Esc><<A err


" C/C++ snippets
autocmd FileType cpp,hpp,c,h inoremap std std::
autocmd FileType cpp,hpp,c,h inoremap cv cv::


"-------------------- Deprecated


" " snippet helper
" imap ,. <Esc>,.
" nnoremap ,. /<++><Enter>"_c4l

