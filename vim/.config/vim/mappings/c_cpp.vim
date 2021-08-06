

" C/C++ snippets
autocmd FileType cpp,hpp,c,h inoremap ,I #include<Space><><Esc>o<++><Esc>?><CR>i
autocmd FileType cpp,hpp,c,h inoremap ,i #include<Space>""<Esc>o<++><Esc>?"<CR>i
autocmd FileType cpp,hpp,c,h inoremap ,f <++><Space><++>(<++>)<CR>{<CR><++><CR>}<Esc>3k^"_c4l
autocmd FileType cpp,hpp,c,h inoremap ,c <++><Space>(<++>)<CR>{<CR><++><CR>}<Esc>3k0f<"_c4l
autocmd FileType cpp,hpp,c,h inoremap /* /*<CR><Esc>cc*/<Esc>O
autocmd FileType cpp,hpp,c,h inoremap std std::
autocmd FileType cpp,hpp,c,h inoremap cv cv::
