-- Aliasing variables
fn = vim.fn
execute = vim.api.nvim_command


vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")


-- Loading vimrc config
vim.cmd 'source ~/.config/vim/init.vim'


-- Aliasing vim environment variables
local o = vim.o -- global
local w = vim.w -- window-local
local b = vim.b -- buffer-local
local t = vim.t -- tab_page-local


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
})

-- SETTINGS
require('settings')


-- PLUGINS
require('plugins')
