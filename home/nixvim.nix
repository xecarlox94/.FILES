{
  pkgs,
  utils,
  ...
}:
let
  vimUtils = utils.vim;
in
{

  home.packages = with pkgs; [
    fzf
  ];

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
        key = vimUtils.mkLKeyBind "tl";
        action = vimUtils.mkCmdAction "TodoTrouble";
        options = {
          desc = "List Project Issues";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = vimUtils.mkLKeyBind "x";
        action.__raw = ''
          function()
            require("conform").format({
              async = true;
              lsp_fallback = true;
            })
          end
        '';
        options = {
          desc = "Format file or range";
        };
      }
    ];

    clipboard.providers.xclip.enable = true;

    plugins = {

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            bash = [ "shellcheck" ];
            rust = [ "rustfmt" ];
            haskell = [ "fourmolu" ];
            nix = [ "nixfmt" ];
            "*" = [ "codespell" ];
            "_" = [ "trim_whitespace" ];
          };
        };
      };

      # TODO: CHECK THIS
      bacon.enable = true;

      rustaceanvim = {
        enable = true;
        settings = {
          tools.enable_clippy = true;
          server = {
            default_settings = {
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "always";
                };
              };
              rust-analyzer = {
                cargo = {
                  allFeatures = true;
                };
                check = {
                  command = "clippy";
                };
                files = {
                  excludeDirs = [
                    "target"
                    ".git"
                    ".cargo"
                    ".github"
                    ".direnv"
                  ];
                };
              };
            };
          };
        };
      };

      haskell-tools = {
        enable = true;
        enableTelescope = true;
        settings = {
          hls = {
            on_attach.__raw = ''
              function(client, bufnr)

                local ht = require('haskell-tools')

                local opts = function(desc)
                  return { 
                    buffer=bufnr, 
                    noremap=true, 
                    silent=true,
                    desc="Haskell: " .. desc
                  }
                end


                vim.keymap.set('n', '<leader>hr', ht.repl.toggle, opts("Toggle Repl"))
                -- vim.keymap.set('n', '<leader>hq', ht.repl.quit, opts(""))

                vim.keymap.set('n', '<leader>ha', ht.lsp.buf_eval_all, opts("Evaluate buffer expressions"))
                vim.keymap.set('n', '<leader>hl', vim.lsp.codelens.run, opts("Code lens refresh"))

                vim.keymap.set('n', '<leader>hi', function()
                  ht.repl.toggle(vim.api.nvim_buf_get_name(0))

                end, opts("GHCI in current buffer"))


              end
            '';
            default_settings = {
              haskell = {
                formattingProvider = "fourmolu";
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
            rust
            ocaml
            json
            lua
            markdown
            nix
            regex
            toml
            xml
            yaml
          ];

          ensure_installed = [
            "rust"
            "haskell"
            "ocaml"
            "nix"
            "markdown"
            "vim"
          ];
        };

      };

      telescope = {
        enable = true;
        keymaps =
          let
            listPairs = [
              {
                k = "tf";
                v = "find_files";
              }
              {
                k = "tg";
                v = "live_grep";
              }
              {
                k = "tb";
                v = "buffers";
              }
              {
                k = "th";
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

      neo-tree = {
        enable = true;

        settings = {
          window = {
            position = "right";
            width = 30;
          };
          enableDiagnostics = true;
          enableModifiedMarkers = true;
        };
      };

      # TODO: extend keywords
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

          ocamllsp.enable = true;

          nil_ls.enable = true;
          nixd.enable = true;

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


      if vim.env.IN_NIX_SHELL then
        vim.opt.shell = "bash"
        vim.opt.shellcmdflag = "-i"
      end

    '';

    extraConfigVim = ''
      "-------------------- SETTINGS

      " FIXES
      set noerrorbells
      set visualbell
      set t_vb=
      set tm=500
      set smartindent
      set smartcase
      set ignorecase
      set nowrap
      set scrolloff=1
      set guicursor=
      set timeoutlen=10

      " macros
      set lazyredraw

      " brackets
      set showmatch
      set mat=2

      " GENERAL
      set nocompatible
      set smarttab


      " CACHE
      set noswapfile
      set nobackup
      set nowb

      " SEARCH SETTINGS
      set incsearch
      set nohlsearch


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
    '';

  };
}
