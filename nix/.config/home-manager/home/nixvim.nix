{ pkgs, ... }:
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
      {
        mode = [ "n" ];
        key = "<leader>cn";
        action = "<cmd>e ~/.config/home-manager/home/nixvim.nix<CR>";
        options = {
          desc = "edit nixvim configuration";
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
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
        extensions = {
          fzf-native.enable = true;
          file-browser.enable = true;
        };
      };

      gitsigns.enable = true;

      lualine.enable = true;
      nvim-tree.enable = true;
      which-key.enable = true;
      trouble.enable = true;
      todo-comments.enable = true;
      comment.enable = true;
      indent-blankline.enable = true;
      illuminate.enable = true;

      web-devicons.enable = true;

      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;

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

            # "<Tab>" = {
            # action = ''
            # function(fallback)
            # if cmp.visible() then
            # cmp.select_next_item()
            # elseif luasnip.expandable() then
            # luasnip.expand()
            # elseif luasnip.expand_or_jumpable() then
            # luasnip.expand_or_jump()
            # else
            # fallback()
            # end
            # end
            # '';
            # modes = [
            # "i"
            # "s"
            # ];
            # };
            # "<S-Tab>" = {
            # action = ''
            # function(fallback)
            # if cmp.visible() then
            # cmp.select_prev_item()
            # elseif luasnip.jumpable(-1) then
            # luasnip.jump(-1)
            # else
            # fallback()
            # end
            # end
            # '';
            # modes = [
            # "i"
            # "s"
            # ];
            # };
          };
        };

      };

      lsp = {
        enable = true;
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

          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            settings = {
              lens.enable = true;
              inlayHints.enable = true;
            };
          };

          hls = {
            enable = true;
            installGhc = true;
            settings = {
              haskell = {
                plugin = {
                  stan.globalOn = true;
                };
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


      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover()
      end)

      vim.keymap.set('n', '<leader>fm', function()
        vim.lsp.buf.format({ async = true })
      end)
    '';
  };

  home.packages = with pkgs; [

    # Rust tools
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer

    # Haskell tools
    ghc
    cabal-install
    stack
    haskellPackages.hlint
    haskellPackages.haskell-language-server
    haskellPackages.haskell-debug-adapter

    nil
    nixd
    nixfmt-rfc-style

    pnpm
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.ts-node
    nodePackages.eslint

    python3
    python3Packages.pip
    python3Packages.black
    python3Packages.flake8
    python3Packages.isort
    # python3Packages.pyright                             # Fix debug
    python3Packages.debugpy

  ];
}
