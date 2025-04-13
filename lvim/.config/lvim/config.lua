-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.colorscheme = "desert"

lvim.plugins = {
  {
    "okuuva/auto-save.nvim",
    version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      -- your config goes here
      -- or just leave it empty :)
    },
  },
}

vim.cmd 'source ~/.config/vim/init.vim'
