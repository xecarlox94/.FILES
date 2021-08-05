" removing all white spaces
autocmd BufWritePre * %s/\s\+$//e

" updating X11 configs
autocmd BufWritePost ~/.Xresources,~/Xdefaults !xrdb %
autocmd BufWritePost ~/.config/vim/vimrc so %
