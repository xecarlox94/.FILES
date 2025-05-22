{ config, pkgs, ... }:
{

  home = {

    username = "xecarlox";
    homeDirectory = "/home/xecarlox";


    enableNixpkgsReleaseCheck = false;

    packages = with pkgs; [

      coreutils

      # TODO: configure this module separately
      yazi

      zathura
      stow

      # TODO: configure this module separately
      firefox
      # TODO: configure this module separately
      brave

      ripgrep
      fd
      # fz

      emacs
      emacsPackages.vterm
      # emacsPackages.org-roam
      # emacsPackages.agda2-mode
      # emacsPackages.proof-general

      texliveFull

      dmenu

      pavucontrol
      # rofi

      # TODO: configure this module separately
      alacritty
      kitty

      flameshot

      # archives
      zip
      unzip
      p7zip

      # It is sometimes useful to fine-tune packages, for example, by applying
      # overrides. You can do that directly here, just don't forget the
      # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # fonts?
      (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      (pkgs.writeShellScriptBin "my-hello" ''
        echo "Hello, ${config.home.username}!"
      '')

    ];


    # TODO: output config toml/json to be input for Nix configuration

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };


    sessionVariables = {
      EDITOR = "nvim";
    };


    stateVersion = "24.11"; # Dont change
  };

  imports = [
    ./nixvim.nix
    ./tmux.nix
  ];

  programs = {

    home-manager = {
      enable = true;
    };


    # TODO: move configuration from bash to zsh
    zsh = {
      enable = true;
    };

    # TODO: configure tmux to work with zsh
    tmux = {
      enable = true;
    };

    gitui = {
      enable = true;
    };

    git = {
      enable = true;
      userEmail = "jf94.uk@gmail.com";
      userName = "xecarlox94";
      # config = {
      #   init = {
      #     defaultBranch = "master";
      #   };
      # };
    };

    vim = {
      enable = true;
      extraConfig = ''
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

  };

  # TODO: make this optional for non-desktop configurations
  xsession = {
    enable = true;
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = pkgs.writeText "xmonad.hs" ''
          import XMonad

          main :: IO()
          main = xmonad (def
              { terminal  = "alacritty"
              })
        '';


      };
    };
  };

}
