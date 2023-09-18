"-------------------- SETTINGS

" FIXES
set noerrorbells
set t_vb=
set tm=500
set clipboard+=unnamedplus
set smartindent
set smartcase
set ignorecase
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
set history=500
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


" CURSOR LINES
" set cursorcolumn
" set cursorline


set hidden
set exrc
" set signcolumn=yes


"-------------------- MAPPINGS

let mapleader = " "


" Important!!!!!!!!!!!! check if dot command can perform these
" pairing operators
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>


" Sudo edit
command! W execute "w !sudo tee % > /dev/null' <bar> edit!


" snippet helper
imap ,. <Esc>,.
nnoremap ,. /<++><Enter>"_c4l

" change local settings
nnoremap <leader>ls :setlocal spell!<CR>
nnoremap <leader>lw :setlocal nowrap!<CR>

" Window
nnoremap <leader>wh :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wq <C-w>wq
nnoremap <leader>ww <C-w>w
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>6 <C-w><
nnoremap <leader>7 <C-w>+
nnoremap <leader>8 <C-w>-
nnoremap <leader>9 <C-w>>



" Functions
function! BuildRunDocker()
    execute "wa"
    execute "! clear && sudo docker run --privileged --rm -it $(sudo docker build -q .)"
endfunction


" File
nnoremap <leader>fw :w<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fx :x<CR>
nnoremap <leader>fk :q!<CR>
nnoremap <leader>fp :r !xclip -o<CR>
vnoremap <leader>fy :w !xclip -sel clip<CR><CR>

" Docker
nnoremap <leader>rd :call BuildRunDocker()<CR>


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



" insert snippets
inoremap ,a <Esc>A
inoremap ,e <Esc>ea
inoremap ,w <Esc>wi
inoremap ,b <Esc>bi
inoremap ,O <Esc>O
inoremap ,o <Esc>o
inoremap ,; <Esc>A;
inoremap ,: <Esc>A:
inoremap ,, <Esc>A,


" autocmd FileType go

autocmd FileType go inoremap if<space>err if err != nil {<CR>}<Esc><<<<Oreturn<Esc><<A err




" C/C++ snippets
autocmd FileType cpp,hpp,c,h inoremap std std::
autocmd FileType cpp,hpp,c,h inoremap cv cv::


"-------------------- AUTO COMMANDS


" add it as map
" removing all white spaces
autocmd BufWritePre * %s/\s\+$//e



" updating X11 configs
autocmd BufWritePost ~/.Xresources,~/Xdefaults !xrdb %
autocmd BufWritePost ~/.config/vim/vimrc so %




"-------------------- MOVE TO SETTINGS
"
"
" work on colorscheme solution for vim and neovim


colorscheme desert
" colorscheme ron
" colorscheme torte
" colorscheme elflord
" colorscheme industry
