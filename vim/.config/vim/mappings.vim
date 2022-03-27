let mapleader = " "


" Important!!!!!!!!!!!! check if dot command can perform these
" pairing operators
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>


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
function! Compile()
    execute "w %"
    execute "! pdflatex %"
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
nnoremap <leader>fp :r !xclip -o<CR>
vnoremap <leader>fy :w !xclip -sel clip<CR><CR>


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
inoremap <silent> <leader><leader> <Esc>
inoremap ,a <Esc>A
inoremap ,e <Esc>ea
inoremap ,w <Esc>wi
inoremap ,b <Esc>bi
inoremap ,O <Esc>O
inoremap ,o <Esc>o
inoremap ,; <Esc>A;
inoremap ,: <Esc>A:
inoremap ,, <Esc>A,



" C/C++ snippets
autocmd FileType cpp,hpp,c,h inoremap ,I #include<Space><><Esc>o<++><Esc>?><CR>i
autocmd FileType cpp,hpp,c,h inoremap ,i #include<Space>""<Esc>o<++><Esc>?"<CR>i
autocmd FileType cpp,hpp,c,h inoremap ,f <++><Space><++>(<++>)<CR>{<CR><++><CR>}<Esc>3k^"_c4l
autocmd FileType cpp,hpp,c,h inoremap ,c <++><Space>(<++>)<CR>{<CR><++><CR>}<Esc>3k0f<"_c4l
autocmd FileType cpp,hpp,c,h inoremap /* /*<CR><Esc>0C*/<Esc>O
autocmd FileType cpp,hpp,c,h inoremap std std::
autocmd FileType cpp,hpp,c,h inoremap cv cv::
