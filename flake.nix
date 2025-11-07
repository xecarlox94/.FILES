
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/modularize-the-configuration

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

    # TODO: investigate if this is safe
    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # FIX: install doom emacs (OR EMACS)
    # FIX: try doom emacs nix-doom-emacs-unstraightened
    # nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    # nix-doom-emacs-unstraightened.inputs.nixpkgs.follows = "";

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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit hostName;
              inherit utils;
            };

            home-manager.users.xecarlox = {
              imports = [

                # FIX: install nixvim as a standalone
                nixvim.homeModules.nixvim
                stylix.homeModules.stylix

                # FIX: try doom emacs nix-doom-emacs-unstraightened
                # inputs.nix-doom-emacs-unstraightened.homeModule
                # inputs.nix-doom-emacs-unstraightened.homeModule

                ./home/home.nix
              ];
            };
          }
        ];
      };

  in {

    # TODO: study this confiduration
    # https://github.com/dbeley/nixos-config/blob/main/flake.nix

    nixosConfigurations = {

      # TODO: Create MACOS config; prepare MacOs configuration adapter
      #
      #   MacOs module should only install tooling, no desktop environment


      nixos = mkLinuxMachine "nixos" "x86_64-linux" ./machines/laptop-hp/configuration.nix;

      thinkcenter = mkLinuxMachine "thinkcenter" "x86_64-linux" ./machines/thinkcenter/configuration.nix;
    };
  };
}


/*

Nice refactoring wishes


Add following programs:
  Glance
  Nix-icons
  sxiv
  Regreet
  Discord

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

Move to wayland:
  Walyland
  Waybar
  Waylock
  Hyperland

Explore insteresting Browsers (I am happy with firefox and qutebrowser, but I am curious):
  Zen browser
  Lady Bird

*/
