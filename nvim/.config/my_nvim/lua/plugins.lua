

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
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enabled = true }
            })
        end
    },
    "nvim-treesitter/playground", -- TODO: add keybinding for this
    -- TODO: https://github.com/ThePrimeagen/harpoon    - https://www.youtube.com/watch?v=w7i4amO_zaE
    -- TODO: https://github.com/mbbill/undotree         - https://www.youtube.com/watch?v=w7i4amO_zaE
    -- TODO: https://github.com/tpope/vim-fugitive      - https://www.youtube.com/watch?v=w7i4amO_zaE


    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {
        'mrcjkb/haskell-tools.nvim',
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' }
    }
})

-- TODO: watch until the end -> https://www.youtube.com/watch?v=w7i4amO_zaE


-- TODO: add keybindings to language servers


local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})
