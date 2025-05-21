{ config, pkgs, ... }:
{

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

  };

  imports = [
    ./nixvim.nix
    ./tmux.nix
  ];
  
  home = {

    username = "xecarlox";
    homeDirectory = "/home/xecarlox";


    enableNixpkgsReleaseCheck = false;

    packages = with pkgs; [

      coreutils

      git

      # TODO: configure this module separately
      yazi

      vim

      zathura
      git
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

  # TODO: make this optional for non-desktop configurations
  xsession = {
    enable = true;
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ../../../../xmonad/.config/xmonad/xmonad.hs;
      };
    };
  };

}
