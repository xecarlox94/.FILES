let mapleader = " "


" change local settings
nnoremap <leader>ls :setlocal spell! spelllang=en_gb<CR>
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
    execute "! pdflatex %"
endfunction

function! ShowPDF()
    execute "! zathura $(echo % \| sed 's/tex$/pdf/') & disown"
endfunction


" File
nnoremap <leader>fc :call Compile()<CR><CR>
nnoremap <leader>fl :call ShowPDF()<CR><CR>
nnoremap <leader>fw :w<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fx :x<CR>
nnoremap <leader>fs :so %<CR>
nnoremap <leader>fk :q!<CR>

" Open
nnoremap <leader>of :e<Space>
nnoremap <leader>os :shell<CR>

" Run
nnoremap <leader>rp :<up><CR>

" snippet helper
imap ,. <Esc>,.
nnoremap ,. /<++><Enter>"_c4l


" pairing operators
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>

inoremap (<CR> (<CR>)<Esc>o<CR><++><Esc>?)<CR>O
inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>o<CR><++><Esc>?}<CR>O
inoremap [ []<left>
inoremap [<CR> [<CR>]<Esc>o<CR><++><Esc>?]<CR>O

inoremap ,; <Esc>A;<CR>


source ~/.config/vim/mappings/c_cpp.vim
