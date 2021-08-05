-- SETTINGS
require('settings')


-- PLUGINS
require('plugins')




vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
