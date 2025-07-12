{
  pkgs,
  utils,
  ...
}:
let
  vimUtils = utils.vim;
in
{
  programs.nixvim = {

    enable = true;

    colorscheme = "desert";

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      tabstop = 2;
      shiftwidth = 2;
      swapfile = false;
    };

    keymaps = [
      # TODO: IMPORTANT remake old keybindings to VIM and Neovim
      {
        mode = [ "n" ];
        key = vimUtils.mkLKeyBind "cn";
        action = vimUtils.mkCmdAction "e ~/.config/home-manager/home/nixvim.nix";
        options = {
          desc = "edit nixvim configuration";
        };
      }
      {
        mode = [ "n" ];
        key = vimUtils.mkLKeyBind "tl";
        action = vimUtils.mkCmdAction "TodoTrouble";
        options = {
          desc = "List Project Issues";
        };
      }

    ];

    plugins = {

      bacon.enable = true;
      conform-nvim = {
        enable = true;
        settings = {formatters_by_ft.rust = ["rustfmt"];};
      };
      # dap-lldb.enable = true;
      rustaceanvim = {
        enable = true;
        settings = {
          tools.enable_clippy = true;
          server = {
            default_settings = {
              inlayHints = {lifetimeElisionHints = {enable = "always";};};
              rust-analyzer = {
                cargo = {allFeatures = true;};
                check = {command = "clippy";};
                files = {excludeDirs = ["target" ".git" ".cargo" ".github" ".direnv"];};
              };
            };
          };
        };
      };

      treesitter = {

        enable = true;

        settings = {
          enable = true;

          incrementalSelection.enable = true;
          indent.enable = true;

          highlight.enable = true;

          grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            bash
            haskell
            json
            lua
            markdown
            nix
            regex
            toml
            vim
            vimdoc
            xml
            yaml
          ];

          ensure_installed = [
            "rust"
            "haskell"
            "nix"
            "markdown"
            "vim"
            "vimdoc"
          ];
        };

      };

      telescope = {
        enable = true;
        keymaps =
          let
            listPairs = [
              {
                k = "ff";
                v = "find_files";
              }
              {
                k = "fg";
                v = "live_grep";
              }
              {
                k = "fb";
                v = "buffers";
              }
              {
                k = "fh";
                v = "help_tags";
              }
            ];
          in
          builtins.listToAttrs (
            map (v: {
              name = vimUtils.mkLKeyBind v.k;
              value = v.v;
            }) listPairs
          );

        extensions = {
          fzf-native.enable = true;
          file-browser.enable = true;
        };
      };

      # TODO: configure keybiding, add default keybinding
      neo-tree = {
        enable = true;
        enableDiagnostics = true;
        enableModifiedMarkers = true;

        window = {
          position = "right";
          width = 30;
        };
      };

      # TODO: extend keywords
      # TODO: add keywords
      todo-comments.enable = true;
      comment.enable = true;
      which-key.enable = true;

      # TODO: check why I need these plugins; configure them
      indent-blankline.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      illuminate.enable = true;

      trouble.enable = true;

      web-devicons.enable = true;

      # TODO: add tui keybinding strategy
      # TODO: add gitui keybinding
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
            heigth = 30;
            width = 90;
          };
          open_mapping = "[[<C-t>]]";
          persist_mode = true;
          persist_size = true;
        };
      };

      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;

      # TODO: add completion for menu options (currently selecting numbers)
      cmp = {
        enable = true;

        autoEnableSources = false;

        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];

          mapping = {
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };

      };

      lsp = {
        enable = true;

        inlayHints = true;
        # inlayHints.enable = true;

        keymaps = {
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
          lspBuf = {
            "gd" = "definition";
            "gD" = "declaration";
            "gi" = "implementation";
            "gt" = "type_definition";
            "gr" = "references";
            "K" = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
            "<leader>f" = "format";
          };
        };

        servers = {

          hls = {
            enable = true;
            installGhc = true;
            settings = {
              haskell = {
                plugin = {
                  stan.globalOn = true;
                  eval.globalOn = true;
                  hlint.globalOn = true;
                  gadt.globalOn = true;
                  class.globalOn = true;
                  rename.globalOn = true;
                  cabal.globalOn = true;
                  cabal-fmt.globalOn = true;
                  module-name.globalOn = true;
                  code-range.globalOn = true;
                  selection-range.globalOn = true;
                  refine-imports.globalOn = true;
                  explicit-fixity.globalOn = true;
                  call-hierarchy.globalOn = true;
                  haddock-comments.globalOn = true;
                  explicit-imports.globalOn = true;
                  overloaded-record.globalOn = true;
                  qualify-imported-names.globalOn = true;
                  tactics.globalOn = true;
                  pragmas.globalOn = true;
                  refactor.globalOn = true;
                };
                # TODO: configure formatter for Haskell
                formattingProvider = "none";
                checkProject = true;
              };
            };
          };

          nil_ls.enable = true;
          nixd.enable = true;

          html.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
        };

      };

    };

    extraConfigLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.autoindent = true
      vim.opt.smartindent = true
      vim.opt.termguicolors = true
      vim.opt.signcolumn = "yes"
      vim.opt.updatetime = 300
      vim.opt.colorcolumn = "80"
      vim.opt.cursorline = true
      vim.opt.wrap = true
    '';

    extraConfigVim = ''
      "-------------------- SETTINGS

      " FIXES
      set noerrorbells
      set visualbell
      set t_vb=
      set tm=500
      set clipboard+=unnamedplus
      set smartindent
      "set autoindent
      set smartcase
      set ignorecase
      set nowrap
      set scrolloff=1
      set guicursor=
      set timeoutlen=10
      set fileencoding=utf8

      " macros
      set lazyredraw

      " search
      set regexpengine=0
      set magic

      " brackets
      set showmatch
      set mat=2

      " GENERAL
      set nocompatible
      set spelllang=en_gb
      set encoding=utf-8
      set bg=dark
      set hid
      set ffs=unix,dos,mac
      set smarttab

      " Backspace
      set backspace=eol,start,indent
      set whichwrap+=<,>,h,l


      " BUILT-IN PLUGINS
      filetype plugin indent on
      syntax on
      " set path+=**


      " CACHE
      set noswapfile
      set nobackup
      set nowb
      set history=5000
      if !has('nvim')
          set viminfofile=~/.cache/vim/viminfo
          set undodir=~/.cache/vim/undodir
          let g:netrw_home=$XDG_CACHE_HOME.'/vim'
          set undofile
      endif

      " SEARCH SETTINGS
      set incsearch
      set nohlsearch


      " WILD MENU
      set wildmenu
      set wildmode=list:longest


      " WINDOW SPLITS
      set splitbelow
      set splitright


      " NUMBERS
      set number
      set relativenumber


      " TABS
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set expandtab

      set hidden
      set exrc



      " Netrw plugin
      let g:netrw_banner = 0
      let g:netrw_list_hide= '^\.\./$,^\./$'
      let g:netrw_hide = 1
      let g:netrw_sizestyle= "h"

      augroup netrw_setup | au!
          au FileType netrw nmap <buffer> l <CR>
          au FileType netrw nmap <buffer> h -
          au FileType netrw nmap <buffer> f %
      augroup END

      autocmd BufWritePre * %s/\s\+$//e
    '';

  };

  home.packages = with pkgs; [
    fzf
  ];
}
