let mapleader = " "


" change local settings
nnoremap <leader>ls :setlocal spell!<CR>
nnoremap <leader>lw :setlocal nowrap!<CR>

" Window
nnoremap <leader>wh :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wq <C-w>wq
" nnoremap <leader>ww <C-w>w
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>6 <C-w><
nnoremap <leader>7 <C-w>+
nnoremap <leader>8 <C-w>-
nnoremap <leader>9 <C-w>>




" Functions
function! Compile()
    execute "w %"
    execute "! pdflatex % && rm -f *.aux *.log *.out"
endfunction

function! ShowPDF()
    execute "! zathura $(echo % \| sed 's/tex$/pdf/') & disown"
endfunction


" File
nnoremap <leader>fc :call Compile()<CR><CR>
nnoremap <leader>fs :call ShowPDF()<CR><CR>
nnoremap <leader>fw :w<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fx :x<CR>
nnoremap <leader>fk :q!<CR>

" Open
nnoremap <leader>of :e<Space>
nnoremap <leader>os :shell<CR>

" Run
nnoremap <leader>rp :<up><CR>


" snippet helper
imap ,. <Esc>,.
nnoremap ,. /<++><Enter>"_c4l


" insert snippets
inoremap ,a <Esc>A
inoremap ,e <Esc>ea
inoremap ,w <Esc>wi
inoremap ,O <Esc>O
inoremap ,o <Esc>o


" pairing operators
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>

inoremap (<CR> (<CR>)<Esc>o<++><Esc>?)<CR>O
inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>o<++><Esc>?}<CR>O
inoremap [ []<left>
inoremap [<CR> [<CR>]<Esc>o<++><Esc>?]<CR>O

inoremap ,; <Esc>A;


source ~/.FILES/vim/.config/vim/mappings/c_cpp.vim
source ~/.FILES/vim/.config/vim/mappings/latex.vim
