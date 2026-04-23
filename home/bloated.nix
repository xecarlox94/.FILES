{ pkgs, lib, ... }:
{

  # move this to the override function for the system configuration
  # 
  # FIX: how to setup monitors
  # https://mynixos.com/nixpkgs/option/services.xserver.xrandrHeads

  # move this to stylix module
  stylix = {
    enable = true;

    image = ../assets/wallpapers/iceland.jpg;

    polarity = "dark";

    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };


    targets = {
      nixvim.enable = false;
      emacs.enable = false;
      vscode.enable = false;
      firefox.profileNames = [ "default" ];
    };


    fonts = {

      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";

      };

      emoji = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };

  fonts.fontconfig.enable = true;

  home = {

    username = "xecarlox";
    homeDirectory = "/home/xecarlox";

    enableNixpkgsReleaseCheck = false;

    shell.enableNushellIntegration = true;
    shell.enableZshIntegration = true;

    packages = with pkgs; [

      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      noto-fonts

      ledger-live-desktop

      # teams-for-linux

      brave

      texliveBasic

      coreutils
      gcc

      # qbittorrent

      brave

      ripgrep
      fd
      fzf

      pavucontrol

      # archives
      zip
      unzip

      # TODO: Email client
      # matrix, irc, rss
      # element-desktop
      # halloy
      # russ
      # Signal, choose the best one
      # signal-desktop
      # gurk-rs

      (pkgs.writeShellScriptBin "commit" ''
        if [ $# -ge 1 ]
        then
            git fetch --all &&\
            git status &&\
            git add . &&\
            git commit -m "$1" &&\
            git push origin
          else
            echo "ERROR"
        fi
      '')

      (pkgs.writeShellScriptBin "thinkcenter_set_displays_old" ''
        xrandr \
          --output DP-1 --off \
          --output HDMI-1 --mode 1920x1200 --pos 0x0 --rotate right \
          --output DP-2 --off \
          --output HDMI-2 --off \
          --output DP-3 --off \
          --output HDMI-3 --mode 1920x1080 --pos 1200x0 --rotate normal \
      '')
    ];

    # TODO: output config factory to be input for Nix configuration

    sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_DESKTOP_DIR = "$HOME/Desktop";
      XDG_DOCUMENTS_DIR = "$HOME/Documents";
      XDG_DOWNLOAD_DIR = "$HOME/Downloads";
      XDG_MUSIC_DIR = "$HOME/Music";
      XDG_PICTURES_DIR = "$HOME/Pictures";
      XDG_TEMPLATES_DIR = "$HOME/Templates";
      XDG_VIDEOS_DIR = "$HOME/Videos";
      XDG_PUBLICSHARE_DIR = "$HOME/Public";

      NIX_STATE_HOME_DIR = "$XDG_STATE_HOME/nix";
      NIX_CONFIG = "experimental-features = nix-command flakes";

      EDITOR = "vim";
      SHELL = "zsh";
      TERM = "alacritty";
      PAGER = "less";
    };

    shellAliases = {
      gst = "git status";
      gp = "git push";
      sd = "sudo shutdown now";
      rb = "reboot";
      v = "nvim";
      ":q" = "exit";
    };

    file = {
      # Building this configuration will create a copy of 'dotfiles/screenrc' in the Nix store. Activating the configuration will then make '~/.screenrc' a symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

    };

    stateVersion = "24.11"; # Dont change
  };

  imports = [
    ./nixvim.nix
  ];

  #services.glance = {
  #enable = true;
  #};

  programs = {

    starship = {
      enable = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
      settings = {
        add_newline = true;
      };
    };

    # TODO: to setup something like this
    # https://github.com/mitchellh/nixos-config/blob/main/pkgs/1password.nix

    home-manager = {
      enable = true;
    };


    # FIX: configure this module separately
    alacritty = {
      enable = true;
      settings = {
        # FIX: add opacity to terminal
        window.opacity = lib.mkForce 0.8;
      };
    };

    doom-emacs = {
      enable = true;
      doomDir = ./doom.d;
      # extraPackages = epkgs: [
      # epkgs.proof-general
      # ];
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          leanprover.lean4
          tamasfe.even-better-toml
        ];
        userSettings = {
          vim = {
            useSystemClipboard = true;
            hlsearch = true;
            handleKeys = {
              "<C-f>" = false;
              "<C-a>" = false;
            };
          };
        };
      };
    };

    zsh = {
      enable = true;
    };

    nushell = {
      enable = true;
      # FIX: need to configure it as the shell scripting platform of choice
    };

    rofi = {
      enable = true;
    };

    bash = {
      enable = true;
    };

    gitui = {
      enable = true;
    };

    btop.enable = true;

    # FIX: add editor automatic opening
    yazi = {
      enable = true;
      shellWrapperName = "yy";
      settings = {
        mgr = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };

    git = {
      enable = true;

      signing.format = "openpgp";

      settings = {
        user.email = "jf94.uk@gmail.com";
        user.name = "xecarlox94";
      };
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
      enableZshIntegration = true;
      exitShellOnExit = true;
    };

    # sioyek = {
    # config.startup_commands=[];
    # enable = true;
    # };

    qutebrowser = {
      enable = true;

      settings = {
        url.default_page = "https://startpage.com";
        content = {
          headers.do_not_track = true;
          default_encoding = "utf-8";
          blocking.adblock.lists = [
            "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2024.txt"
            "https://easylist.to/easylist/easylist.txt"
            "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
            "https://easylist.to/easylist/easyprivacy.txt"
            "https://easylist-downloads.adblockplus.org/liste_fr.txt"
            "https://easylist-downloads.adblockplus.org/ruadlist.txt"
            "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
          ];
        };
        editor = {
          command = [
            "$SHELL"
            "-e"
            "nvim"
            "{}"
          ];
        };
        downloads = {
          position = "bottom";
          location.directory = "$HOME/Downloads";
        };
        scrolling.smooth = false;
        statusbar = {
          show = "in-mode";
          position = "bottom";
          widgets = [
            "keypress"
            "search_match"
            "url"
            "scroll"
            "history"
            "tabs"
            "progress"
            "clock:%H:%M"
          ];
        };
        tabs = {
          show = "multiple";
          position = "top";
          new_position.related = "next";
          new_position.unrelated = "next";
        };
      };
      keyBindings = {
        normal = {
          # ",M" = "spawn ~/scripts/umpv.py {url}";
          # ",m" = "hint links spawn ~/scripts/umpv.py {hint-url}";
          # ";m" = "hint --rapid links spawn ~/scripts/umpv.py {hint-url}";
        };
      };
      searchEngines = {
        "DEFAULT" = "https://www.startpage.com/do/search?query={}";
        "s" = "https://www.startpage.com/do/search?query={}";
        "yt" = "https://youtube.com/results?search_query={}";
        "g" = "https://www.google.com/search?q={}";
        "qw" = "https://qwant.com/?q={}&t=web";
        "qwi" = "https://qwant.com/?q={}&t=images";
        "gi" = "https://www.google.com/search?q={}&tbm=isch";
      };
    };

    # FIX: configure this module separately
    #
    # To add this to the config
    # https://github.com/dbeley/nixos-config/blob/main/apps/firefox/firefox.nix
    firefox = {

      enable = true;

      policies = {
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        ShowHomeButton = true;
      };

      profiles.default = {
        # Define a default profile
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "network.cookie.httpsOnly" = true;

          "browser.startup.homepage" = "https://www.startpage.com/";

          "extensions.pocket.enabled" = false;

          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;

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
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "privacy.partition.network_state.ocsp_cache" = true;

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "accessibility.force_disabled" = 1;

          "apz.overscroll.enabled" = true;
          "beacon.enabled" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.compactmode.show" = true;
          "browser.contentblocking.category" = "strict";
          "browser.display.background_color" = "#666666";
          "browser.download.alwaysOpenPanel" = false;
          "browser.download.always_ask_before_handling_new_types" = true;
          "browser.download.autoHideButton" = false;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.open_pdf_attachments_inline" = true;
          "browser.download.panel.shown" = true;
          "browser.download.useDownloadDir" = false;
          "browser.download.viewableInternally.typeWasRegistered.svg" = true;
          "browser.download.viewableInternally.typeWasRegistered.webp" = true;
          "browser.download.viewableInternally.typeWasRegistered.xml" = true;
          "browser.formfill.enable" = false;
          "browser.fullscreen.autohide" = false;
          "browser.menu.showViewImageInfo" = true;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = true;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
          "browser.newtabpage.activity-stream.section.highlights.rows" = 4;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.topSitesRows" = 4;
          "browser.newtabpage.pinned" = "[]";
          "browser.preferences.moreFromMozilla" = false;
          "browser.safebrowsing.enabled" = false;
          "browser.safebrowsing.malware.enabled" = false;
          "browser.search.context.loadInBackground" = true;
          "browser.search.defaultenginename" = "ddg";
          "browser.search.order.1" = "ddg";
          "browser.search.region" = "FR";
          "browser.send_pings" = false;
          "browser.sessionstore.interval" = 60000;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.startup.page" = 3;
          "browser.tabs.firefox-view" = false;
          "browser.tabs.firefox-view-next" = false;
          "browser.tabs.insertAfterCurrent" = true;
          "browser.tabs.loadBookmarksInBackground" = true;
          "browser.tabs.tabmanager.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.translation.neverForLanguages" = "fr";
          "browser.uidensity" = 1;
          "browser.urlbar.doubleClickSelectsAll" = false;
          "browser.urlbar.suggest.calculator" = true;
          "browser.urlbar.suggest.topsites" = false;
          "browser.urlbar.trimURLS" = false;
          "browser.urlbar.unitConversion.enabled" = true;
          "dom.battery.enabled" = false;
          "dom.enable_web_task_scheduling" = true;
          "dom.event.clipboardevents.enabled" = false;
          "dom.security.sanitizer.enabled" = true;
          # "extensions.formautofill.addresses.enabled" = false;
          # "extensions.formautofill.available" = "off";
          # "extensions.formautofill.creditCards.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          # "extensions.pocket.enabled" = false;
          "findbar.highlightAll" = true;
          "fission.autostart" = true;
          "full-screen-api.transition-duration.enter" = "0 0";
          "full-screen-api.transition-duration.leave" = "0 0";
          "full-screen-api.warning.delay" = -1;
          "full-screen-api.warning.timeout" = 0;
          "general.autoScroll" = true;
          "general.smoothScroll" = false;
          "gfx.webrender.all" = true;
          "identity.fxaccounts.enabled" = true;
          "javascript.use_us_english_locale" = true;
          "layout.css.grid-template-masonry-value.enabled" = true;
          "layout.css.has-selector.enabled" = true;
          "layout.spellcheckDefault" = 0;
          "media.ffmpeg.vaapi.enabled" = true;
          "media.ffvpx.enabled" = false;
          "media.hardwaremediakeys.enabled" = true;
          "media.navigator.mediadatadecoder_vpx_enabled" = true;
          "media.rdd-vpx.enabled" = false;
          "media.videocontrols.picture-in-picture.audio-toggle.enabled" = true;
          "media.videocontrols.picture-in-picture.keyboard-controls.enabled" = true;
          "mousewheel.default.delta_multiplier_y" = 275;
          "network.IDN_show_punycode" = true;
          "network.cookie.cookieBehavior" = 5;
          "network.dns.max_high_priority_threads" = 8;
          "network.dnsCacheExpiration" = 3600;
          "network.http.pacing.requests.enabled" = false;
          "network.ssl_tokens_cache_capacity" = 10240;
          "nglayout.initialpaint.delay" = 0;
          "nglayout.initialpaint.delay_in_oopif" = 0;
          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.downloads" = true;
          "privacy.clearOnShutdown.formdata" = true;
          "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.offlineApps" = false;
          "privacy.clearOnShutdown.sessions" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.firstparty.isolate" = true;
          "privacy.firstparty.isolate.restrict_opener_access" = true;
          "privacy.query_stripping.enabled" = true;
          "privacy.query_stripping.enabled.pbmode" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" = false;
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.spoof_english" = 2;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "privacy.window.maxInnerHeigth" = 900;
          "privacy.window.maxInnerWidth" = 1600;
          "security.OCSP.enabled" = 1;
          "security.OCSP.require" = true;
          "security.pki.crlite_mode" = 2;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.ssl.enable_ocsp_must_staple" = true;
          "security.ssl.enable_ocsp_stapling" = true;
          "security.ssl.require_safe_negotiation" = true;
          "signon.autofillForms" = false;
          "signon.generation.enabled" = false;
          "signon.management.page.breach-alerts.enabled" = false;
          "signon.rememberSignons" = false;
          "ui.systemUsesDarkTheme" = 1;
          "webgl.disabled" = false;
          "widget.use-xdg-desktop-portal.file-picker" = 0;
        };
      };
    };

    vim = {
      enable = true;
      extraConfig = ''

        " FIXES
        set noerrorbells
        set visualbell
        set t_vb=
        set tm=500
        set clipboard+=unnamedplus
        set smartindent
        set autoindent
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
    windowManager =
      let
        # TODO: use environment shell cmds and variables
        # FIX: move spawn launcher outside of config
        exec_program_launcher = "rofi -show run";

      in
      {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = pkgs.writeText "xmonad.hs" ''
            import XMonad
            import XMonad.Util.EZConfig

            main :: IO ()
            main = xmonad $ def
                { terminal  = "alacritty"
                }
                `additionalKeys`
                [ ((mod1Mask,               xK_p     ), spawn "${exec_program_launcher}")
                ]
          '';
        };
      };
  };

}
