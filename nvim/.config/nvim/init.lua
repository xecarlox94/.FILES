vim.cmd 'source ~/.config/vim/init.vim'

vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")


vim.g.maplocalleader = "\\"


-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "folke/which-key.nvim", lazy = true },
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
      build = ":MasonUpdate",
      opts_extend = { "ensure_installed" },
      opts = {
        ensure_installed = {
          "stylua",
          "shfmt",
        },
      },
      ---@param opts MasonSettings | {ensure_installed: string[]}
      config = function(_, opts)
        require("mason").setup(opts)
        local mr = require("mason-registry")
        mr:on("package:install:success", function()
          vim.defer_fn(function()
            -- trigger FileType event to possibly load this newly installed LSP server
            require("lazy.core.handler.event").trigger({
              event = "FileType",
              buf = vim.api.nvim_get_current_buf(),
            })
          end, 100)
        end)

        mr.refresh(function()
          for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
        end)
      end,
    },
    -- {
      -- 'mrcjkb/haskell-tools.nvim',
      -- version = '^4', -- Recommended
      -- lazy = false, -- This plugin is already lazy
    -- },
    {
      "nvim-treesitter/nvim-treesitter",
      version = false, -- last release is way too old and doesn't work on Windows
      build = ":TSUpdate",
      event = { "LazyFile", "VeryLazy" },
      lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
      init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
      end,
      cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
      keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>", desc = "Decrement Selection", mode = "x" },
      },
      opts_extend = { "ensure_installed" },
      ---@type TSConfig
      ---@diagnostic disable-next-line: missing-fields
      opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "printf",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          },
        },
      },
      ---@param opts TSConfig
      config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})


vim.diagnostic.config({
    virtual_text = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

