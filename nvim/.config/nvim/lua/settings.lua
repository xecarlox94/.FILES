
-- Loading vimrc config
vim.cmd 'source ~/.config/vim/init.vim'

vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

-- Aliasing vim environment variables
local o = vim.o -- global
local w = vim.w -- window-local
local b = vim.b -- buffer-local
local t = vim.t -- tab_page-local
