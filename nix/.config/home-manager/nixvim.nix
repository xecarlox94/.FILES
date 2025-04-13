{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins = {

      treesitter = {
        enable = true;
        incrementalSelection.enable = true;
        indent = true;
        ensureInstalled = [
          "rust"
          "haskell"
          "nix"
          "ocaml"
          "typescript"
          "javascript"
          "lua"
          "python"
          "go"
          "markdown"
          "vim"
          "vimdoc"
          "query"
        ];
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

      # Git integration
      gitsigns.enable = true;

      # Utils
      lualine.enable = true;
      nvim-tree.enable = true;
      which-key.enable = true;
      trouble.enable = true;
      todo-comments.enable = true;
      comment.enable = true;
      indent-blankline.enable = true;
      illuminate.enable = true;

      # Completion
      nvim-cmp = {
        enable = true;
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
          # modes = [ "i" "s" ];
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
          # modes = [ "i" "s" ];
          # };

        };
        # sources = [
        # { name = "nvim_lsp"; }
        # { name = "luasnip"; }
        # { name = "buffer"; }
        # { name = "path"; }
        # ];
      };

      luasnip = {
        enable = true;
        # fromVscode = true;
      };

      # LSP Configuration
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

          # Rust
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            settings = {
              # checkOnSave.command = "clippy";
              lens.enable = true;
              inlayHints.enable = true;
            };
          };

          # Haskell
          hls = {
            enable = true;
            installGhc = true;
            settings = {
              haskell = {
                plugin.stan.globalOn = true;
                # formattingProvider = "ormolu";
                checkProject = true;
              };
            };
          };

          # Nix
          nil_ls.enable = true;
          nixd.enable = true;

          # OCaml
          # ocamllsp.enable = true;

          # TypeScript/JavaScript
          tsserver.enable = true;
          eslint.enable = true;

          # Lua
          lua-ls = {
            enable = true;
            settings = {
              completion = { callSnippet = "Replace"; };
              telemetry = { enable = false; };
              diagnostics = { globals = [ "vim" ]; };
            };
          };

          # Python
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

          # Go
          gopls = {
            enable = true;
            settings = {
              usePlaceholders = true;
              completeUnimported = true;
              staticcheck = true;
              analyses = {
                unusedparams = true;
                shadow = true;
              };
            };
          };

          # General purpose
          html.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
        };

      };

    };

    extraConfigLua = ''
      -- Basic settings
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
      vim.opt.wrap = false

      -- DAP keybindings
      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
      vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
      vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)

      -- Debugging UI
      vim.keymap.set('n', '<leader>du', function() require('dapui').toggle() end)

      -- LSP hover documentation in a floating window
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover()
      end)

      -- Format document
      vim.keymap.set('n', '<leader>fm', function()
        vim.lsp.buf.format({ async = true })
      end)

      -- Language specific keybindings
      -- Go
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          vim.keymap.set('n', '<leader>gt', function() vim.cmd('GoTest') end, { buffer = true })
          vim.keymap.set('n', '<leader>gi', function() vim.cmd('GoImport') end, { buffer = true })
          vim.keymap.set('n', '<leader>gI', function() vim.cmd('GoImpl') end, { buffer = true })
          vim.keymap.set('n', '<leader>gfs', function() vim.cmd('GoFillStruct') end, { buffer = true })
        end
      })

      -- Python
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          vim.keymap.set('n', '<leader>py', function() vim.cmd('!python3 %') end, { buffer = true })
        end
      })

      -- Rust
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
          vim.keymap.set('n', '<leader>rr', function() vim.cmd('RustRun') end, { buffer = true })
          vim.keymap.set('n', '<leader>rt', function() vim.cmd('RustTest') end, { buffer = true })
        end
      })
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
    haskellPackages.haskell-language-server
    haskellPackages.hlint
    haskellPackages.ormolu
    haskellPackages.haskell-debug-adapter

    # Nix tools
    nil
    nixd
    nixfmt

    # OCaml tools
    ocaml
    opam
    ocamlPackages.merlin
    ocamlPackages.ocaml-lsp
    # ocamlPackages.dune

    # TypeScript/JavaScript tools
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.ts-node
    nodePackages.eslint
    # nodePackages.node-debug2-adapter

    # Lua tools
    sumneko-lua-language-server
    stylua

    # Python tools
    python3
    python3Packages.pip
    python3Packages.black
    python3Packages.flake8
    python3Packages.isort
    # python3Packages.pyright
    python3Packages.debugpy

    # Go tools
    go
    gopls
    golangci-lint
    delve
    gotools # For goimports, etc.

    # General dev tools
    fzf
  ];
}
