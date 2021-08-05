-- Loading vimrc config
vim.cmd 'source ~/.config/vim/vimrc'

local o = vim.o -- global
local wo = vim.wo -- window-local
local bo = vim.bo -- buffer-local

o.number = true
o.relativenumber = false
