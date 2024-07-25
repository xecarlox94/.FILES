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

let mapleader = " "


" Functions
function! Compile()
    execute "w %"
    execute "! pdflatex %"
endfunction

function! ShowPDF()
    execute "! zathura $(echo % \| sed 's/tex$/pdf/') & disown"
endfunction

" Run
nnoremap <leader>rp :<up><CR>


" File
nnoremap <leader>fc :call Compile()<CR><CR>
nnoremap <leader>fl :call ShowPDF()<CR><CR>

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


" File
nnoremap <leader>fw :w<CR>
nnoremap <leader>fx :x<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fk :q!<CR>
" nnoremap <leader>fp :r !xclip -o<CR>
" vnoremap <leader>fy :w !xclip -sel clip<CR><CR>


" Explore - navigation
nnoremap <leader>n :Ex<CR>


" Tab
nnoremap <leader>tn :tabNext<CR>
nnoremap <leader>to :tabnew<Space>
nnoremap <leader>tp :tabprevious<CR>

" Open
nnoremap <leader>of :e<Space>
nnoremap <leader>os :shell<CR>
nnoremap <leader>ot :vert ter<CR>
nnoremap <leader>ob :buffers<CR>:b<Space>

" Console
nnoremap <leader>cl :<C-f>
nnoremap <leader>cp :<up><CR>
nnoremap <leader>cs :!
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


augroup netrw_setup | au!
    au FileType netrw nmap <buffer> l <CR>
    au FileType netrw nmap <buffer> h -
    au FileType netrw nmap <buffer> f %
augroup END


" pairing operators
" iabb \" \""<left>
" iabb ' ''<left>
" iabb ( ()<left>
" iabb { {}<left>
" iabb [ []<left>



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


if !has('nvim')
    colorscheme desert
    " colorscheme ron
    " colorscheme torte
    " colorscheme elflord
    " colorscheme industry
endif



"-------------------- Autocommands


" autocmd FileType go
autocmd FileType go inoremap if<space>err if err != nil {<CR>}<Esc><<<<Oreturn<Esc><<A err


" C/C++ snippets
autocmd FileType cpp,hpp,c,h inoremap std std::
autocmd FileType cpp,hpp,c,h inoremap cv cv::


"-------------------- Deprecated


" " snippet helper
" imap ,. <Esc>,.
" nnoremap ,. /<++><Enter>"_c4l

