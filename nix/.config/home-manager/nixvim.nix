{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    colorscheme = "desert";

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      tabstop = 2;
      shiftwidth = 4;
      swapfile = false;
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>cn";
        action = "<cmd>e ~/.config/home-manager/nixvim.nix<CR>";
        options = {
          desc = "edit nixvim configuration";
        };
      }
    ];

    plugins = {

      treesitter = {
        settings = {
          enable = true;
          incrementalSelection.enable = true;
          indent = true;

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
            "query"
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

      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      web-devicons.enable = true;

      # Completion
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
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            settings = {
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
                plugin = {
                  stan.globalOn = true;
                };
                formattingProvider = "none";
                checkProject = true;
              };
            };
          };

          # Nix
          nil_ls.enable = true;
          nixd.enable = true;

          # TypeScript/JavaScript
          ts_ls.enable = true;
          eslint.enable = true;

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

          # General purpose
          html.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
        };

      };


      dap-virtual-text.enable = false;
      dap-ui.enable = true;

      dap = {
        enable = true;
        adapters = {
          executables = {
            # Rust debugging
            # codelldb = {
              # command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
              # name = "codelldb";
            # };
            # Haskell debugging
            # haskell-debug-adapter = {
              # command = "${pkgs.haskellPackages.haskell-debug-adapter}/bin/haskell-debug-adapter";
              # name = "haskell";
            # };
            # Python debugging
            # debugpy = {
              # command = "${pkgs.python3Packages.debugpy}/bin/python";
              # args = [
                # "-m"
                # "debugpy.adapter"
              # ];
              # name = "debugpy";
            # };
            # JS/TS debugging
            # node-debug2 = {
              # command = "${pkgs.nodePackages.node-debug2-adapter}/bin/node-debug2-adapter";
              # name = "node2";
            # };
          };
        };

        # configurations = {
        # rust = [
        # {
        # name = "Launch Rust";
        # type = "codelldb";
        # request = "launch";
        # program = "''${workspaceFolder}/target/debug/''${fileBasenameNoExtension}";
        # cwd = "''${workspaceFolder}";
        # stopOnEntry = false;
        # args = [];
        # initCommands = [];
        # }
        # ];
        # haskell = [
        # {
        # name = "Launch Haskell";
        # type = "haskell";
        # request = "launch";
        # program = "''${workspaceFolder}/app/Main.hs";
        # workspace = "''${workspaceFolder}";
        # startup = "''${workspaceFolder}/test/Spec.hs";
        # stopOnEntry = true;
        # logFile = "''${workspaceFolder}/logs/debug.log";
        # }
        # ];
        # python = [
        # {
        # name = "Launch Python";
        # type = "debugpy";
        # request = "launch";
        # program = "''${file}";
        # pythonPath = "''${command:python.interpreterPath}";
        # console = "integratedTerminal";
        # justMyCode = false;
        # }
        # ];
        # javascript = [
        # {
        # name = "Launch Node.js";
        # type = "node2";
        # request = "launch";
        # program = "''${file}";
        # cwd = "''${workspaceFolder}";
        # sourceMaps = true;
        # protocol = "inspector";
        # console = "integratedTerminal";
        # }
        # ];
        # typescript = [
        # {
        # name = "Launch TypeScript";
        # type = "node2";
        # request = "launch";
        # program = "''${workspaceFolder}/node_modules/.bin/ts-node";
        # args = ["''${file}"];
        # cwd = "''${workspaceFolder}";
        # sourceMaps = true;
        # protocol = "inspector";
        # console = "integratedTerminal";
        # }
        # ];
        # };
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
      vim.opt.wrap = true


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


    # Nix tools
    nil
    nixd
    nixfmt-rfc-style

    # TypeScript/JavaScript tools
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.ts-node
    nodePackages.eslint
    # nodePackages.node-debug2-adapter                    # Fix debug

    # Python tools
    python3
    python3Packages.pip
    python3Packages.black
    python3Packages.flake8
    python3Packages.isort
    # python3Packages.pyright                             # Fix debug
    python3Packages.debugpy

  ];
}
