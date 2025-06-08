{ config, pkgs, ... }:
{

  home = {

    username = "xecarlox";
    homeDirectory = "/home/xecarlox";


    enableNixpkgsReleaseCheck = false;

    shell.enableNushellIntegration = true;

    packages = with pkgs; [

      pkgs.haskellPackages.zlib
      zlib
      zlib.dev

      coreutils

      # FIX: configure this module separately
      brave


      # TODO: include these tools in workflow
      ripgrep
      fd
      fzf

      pavucontrol

      # FIX: configure this module separately
      alacritty

      flameshot

      # archives
      zip
      unzip
      p7zip

      # FIX: fix font import
      #
      # It is sometimes useful to fine-tune packages, for example, by applying overrides. You can do that directly here
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })


      (pkgs.writeShellScriptBin "commit" ''
          if [ $# -ge 1 ]
          then
              git status &&\
              git add . &&\
              git commit -m "$1" &&\
              git push --all origin
            else
              echo "ERROR"
          fi
        ''
      )

    ];


    # TODO: output config factory to be input for Nix configuration


    sessionVariables = {
      XDG_CONFIG_HOME="$HOME/.config";
      XDG_CACHE_HOME="$HOME/.cache";
      XDG_DATA_HOME="$HOME/.local/share";
      XDG_STATE_HOME="$HOME/.local/state";
      XDG_DESKTOP_DIR="$HOME/Desktop";
      XDG_DOCUMENTS_DIR="$HOME/Documents";
      XDG_DOWNLOAD_DIR="$HOME/Downloads";
      XDG_MUSIC_DIR="$HOME/Music";
      XDG_PICTURES_DIR="$HOME/Pictures";
      XDG_TEMPLATES_DIR="$HOME/Templates";
      XDG_VIDEOS_DIR="$HOME/Videos";
      XDG_PUBLICSHARE_DIR="$HOME/Public";

      NIX_STATE_HOME_DIR="$XDG_STATE_HOME/nix";
      NIX_CONFIG="experimental-features = nix-command flakes";

      EDITOR = "nvim";
      SHELL="nu";
      TERM="alacritty";
      PAGER="less";
    };

    shellAliases = {
      gst="git status";
      gp="git push";
      siu="sudo";
      sd="sudo shutdown now";
      rb="reboot";
      v="nvim";
      py="python3";
      ":q"="exit";
    };

    file = {
      # Building this configuration will create a copy of 'dotfiles/screenrc' in the Nix store. Activating the configuration will then make '~/.screenrc' a symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;


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

    nushell = {
      enable = true;
    };

    # FIX: configure this module separately
    firefox = {
      enable = true;
      profiles.default = {  # Define a default profile
        # TODO: check this configuration
        #
        # https://github.com/TLATER/dotfiles/blob/b39af91fbd13d338559a05d69f56c5a97f8c905d/home-config/config/graphical-applications/firefox.nix
        # extensions = with pkgs; [
        #   nur.repos.rycee.firefox-addons.ublock-origin  # Example: UBlock Origin
        #   nur.repos.rycee.firefox-addons.privacy-badger  # Example: Privacy Badger
          # nur.repos.rycee.firefox-addons.floccus
          # nur.repos.rycee.firefox-addons.kagi-search
          # nur.repos.rycee.firefox-addons.keepassxc-browser
          # nur.repos.rycee.firefox-addons.multi-account-containers
          # nur.repos.rycee.firefox-addons.ublacklist
        # ];
        settings = {
          "browser.startup.homepage" = "https://google.com";
          "network.cookie.httpsOnly" = true;

          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;

          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.partition.network_state.ocsp_cache" = true;

          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "extensions.pocket.enabled" = false;
          "extensions.pocket.api" = "";
          "extensions.pocket.oAuthConsumerKey" = "";
          "extensions.pocket.showHome" = false;
          "extensions.pocket.site" = "";
        };
      };
    };


    rofi = {
      enable = true;
    };

    bash = {
      enable = true;
    };

    emacs = {
      enable = true;
      package = pkgs.emacs;
    };


    # FIX: doom emacs instalation

    # doom-emacs = {
    #   enable = true;
    #   doomDir = ../doom;
    # };


    # TODO: configure tmux to work with zsh
    tmux = {
      enable = true;
      extraConfig = ''

        set-option -g history-limit 10000

        set -g mouse on

        set -g base-index 1
        setw -g pane-base-index 1

        setw -g renumber-windows on

        set -g default-shell $SHELL

        set -g default-terminal "tmux-256color"

        unbind C-b
        set-option -g prefix C-Space
        bind C-Space send-prefix

        bind i split-window -hc "#{pane_current_path}"
        unbind '"'

        bind - split-window -vc "#{pane_current_path}"
        unbind %

        bind c new-window -c "#{pane_current_path}"

        # bind r source $XDG_CONFIG_HOME/tmux/tmux.conf

        bind Space last-window

        setw -g mode-keys vi
      '';
    };

    gitui = {
      enable = true;
    };

    # FIX: add editor automatic opening
    yazi = {
      enable = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };

    git = {
      enable = true;
      userEmail = "jf94.uk@gmail.com";
      userName = "xecarlox94";
      # FIX: adding settings to config
      #
      # config = {
      #   init = {
      #     defaultBranch = "master";
      #   };
      # };
    };

    zellij = {
      enable = true;
      settings = {
        default_mode = "locked"; # FIX:
      };

      # attachExistingSession	= "";
      # enableBashIntegration	= "";
      # enableFishIntegration	= "";
      # enableZshIntegration	= "";
      # exitShellOnExit	= "";
      # themes= "";
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
