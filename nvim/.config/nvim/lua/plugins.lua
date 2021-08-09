-- Auto install packer if necessary
local ipath = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(ipath)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..ipath)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua PackerCompile'


return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- LSP
    use { 'neovim/nvim-lspconfig' }

    -- Completion
    use {'hrsh7th/nvim-compe'}
end)
