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
          desc = "List project todos";
        };
      }

    ];

    plugins = {

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
            make
            markdown
            typescript
            javascript
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
            "typescript"
            "javascript"
            "python"
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
              { k= "ff"; v="find_files"; }
              { k= "fg"; v="live_grep"; }
              { k= "fb"; v="buffers"; }
              { k= "fh"; v="help_tags"; }
            ];
          in
            builtins.listToAttrs 
              ( map 
                ( v: { name = vimUtils.mkLKeyBind v.k; value = v.v; } 
                ) 
                listPairs 
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

      # TODO: check why I need these plugins; configure them
      comment.enable = true;
      indent-blankline.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      which-key.enable = true;
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

          # TODO: make sure rust environment is currently set up
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            settings = {
              lens.enable = true;
              inlayHints.enable = true;
            };
          };

          # TODO: make sure haskell environment is currently set up
          hls = {
            enable = true;
            installGhc = true;
            settings = {
              haskell = {
                plugin = {
                  stan.globalOn = true;
                };
                # TODO: configure formatter for Haskell
                formattingProvider = "none";
                checkProject = true;
              };
            };
          };

          nil_ls.enable = true;
          nixd.enable = true;

          ts_ls.enable = true;
          eslint.enable = true;

          pyright = {
            enable = true;
            settings = {
              analysis = {
                typeCheckingMode = "basic";
                autoSearchPaths = true;
                useLibraryCodeForTypes = true;
                diagnosticMode = "workspace";
              };
            };
          };

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
  };

  home.packages = with pkgs; [

    fzf

    # Rust tools
    # TODO: verify if they are required, make lsp define required packages
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer


    # Haskell tools
    # TODO: verify if they are required, make lsp define required packages
    ghc
    cabal-install
    stack
    haskellPackages.hlint
    haskellPackages.haskell-language-server
    haskellPackages.haskell-debug-adapter

    nil
    nixd
    nixfmt-rfc-style


    # TODO: verify if they are required, make lsp define required packages
    pnpm
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.ts-node
    nodePackages.eslint

    # TODO: verify if they are required, make lsp define required packages
    python3
    python3Packages.pip
    python3Packages.black
    python3Packages.flake8
    python3Packages.isort
    # python3Packages.pyright                             # Fix debug
    python3Packages.debugpy

  ];
}
