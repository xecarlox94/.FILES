
# great start
# https://github.com/jackdbd/nix-config

# modularisation question
# https://discourse.nixos.org/t/how-do-you-structure-your-nixos-configs/65851/2
# Dendentric pattern in nix
# https://github.com/mightyiam/dendritic
# https://github.com/vic/dendrix

# Wayland riced config
# https://gitlab.com/Zaney/zaneyos

# Wayland riced config
# https://github.com/lawrab/nixos-config

# Wayland riced config
# https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles

# Multi PLatform
# https://github.com/misterio77/nix-config

# https://github.com/Misterio77/nix-starter-configs

# modularisation, with mac os as well
# https://github.com/MatthiasBenaets/nix-config

# Doom emacs guy
# https://github.com/hlissner/dotfiles

# with emacs stuff
# https://github.com/vic/vix

# Nice config
# https://github.com/dbeley/nixos-config/blob/main/flake.nix

# https://github.com/AlexNabokikh/nix-config

# multi device, including servers and phones
# https://github.com/MatthewCroughan/nixcfg


# configures pinephone
# https://github.com/tolkonepiu/best-of-nix#nix-configurations

# Compilation of configurations
# https://github.com/tolkonepiu/best-of-nix#nix-configurations

# https://github.com/tomwrw/nix-config

# Mobile Nix OS
# https://github.com/mobile-nixos/mobile-nixos

# Book to follow along
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/modularize-the-configuration


/*

Nice refactoring wishes

Move to wayland:
  Walyland
  Waybar
  Waylock
  Hyperland

Add following programs:
  Glance
  Nix-icons
  sxiv
  Regreet

Add desktop capabilities:
  I want to be able to get a menu of most used applications
  perhaps sort them in categories

Configuration:
  Fix floating terminal in Neovim
  configure nushell
  Add transparency
     to alacritty
     To neovim
     To zellij
  check stylix configs for:
    Firefox
    Neovim
    Grub
    add UseWalpaper option to DisplayManager
  Check if there are issues with NUR
    Need to install a few extensions

Modularisation
    Modularise big configs into their own files
    Organise modules by
         <System>/<DesktopEnv>
    Modularise OS/Hardware configuration

I want a system wide notification system (Working in X11 or Wayland):
  I have heard of Dunst
  I want something with a great interface

*/

{
  description = "Local machine configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  # FIX: add password management to this environment


  outputs = { nixpkgs, home-manager, stylix, nixvim, ... }@inputs:
  let

    # TODO: modularise keybindings for IDEs, variables, aliases, functions
    utils = import ./lib;


    mkLinuxMachine = hostName: systemArch: machineConfiguration:
      nixpkgs.lib.nixosSystem {

        system = systemArch;

        specialArgs = inputs // { inherit hostName; };

        modules = [

          machineConfiguration

          home-manager.nixosModules.home-manager
          {
            # I think it was included by a previous stylix instalation instruction
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit hostName;
              inherit utils;
            };


            # allowUnfree = { nixpkgs.config.allowUnfree = true; };


            home-manager.users.xecarlox = {
              imports = [

                # FIX: install nixvim as a standalone
                nixvim.homeModules.nixvim

                stylix.homeModules.stylix

                ./home/home.nix
              ];
            };
          }
        ];
      };

  in {

    nixosConfigurations = {

      # TODO: Create MACOS config; prepare MacOs configuration adapter
      #
      #   MacOs module should only install tooling, no desktop environment


      nixos = mkLinuxMachine "nixos" "x86_64-linux" ./machines/laptop-hp/configuration.nix;

      thinkcenter = mkLinuxMachine "thinkcenter" "x86_64-linux" ./machines/thinkcenter/configuration.nix;
    };
  };
}
