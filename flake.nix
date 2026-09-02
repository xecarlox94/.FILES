{
  description = "My Nix environments";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # FIX: add password management to this environment

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    let

      # TODO: modularise keybindings for IDEs, variables, aliases, functions
      utils = import ./lib;

      mkLinuxDesktopMachine =
        {
          hostName,
          system,
          machineConfiguration,
        }:
        {
          name = hostName;
          value = nixpkgs.lib.nixosSystem {

            inherit system;

            specialArgs = inputs // {
              inherit hostName;
            };

            modules = [

              machineConfiguration

              { nixpkgs.config.allowUnfree = true; }

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";

                home-manager.extraSpecialArgs = {
                  inherit hostName utils;
                };

                home-manager.users.xecarlox = {
                  imports = [

                    # FIX: install nixvim as a standalone
                    inputs.nixvim.homeModules.nixvim

                    inputs.nix-doom-emacs-unstraightened.homeModule

                    inputs.stylix.homeModules.stylix

                    ./home
                  ];
                };
              }
            ];

            # FIX: allow unfree problem
            # nixpkgs.config.allowUnfree = true;
          };
        };

      linuxDesktopMachines = map mkLinuxDesktopMachine [
        {
          hostName = "nixos";
          system = "x86_64-linux";
          machineConfiguration = ./hosts/machines/laptop-hp/configuration.nix;
        }
        {
          hostName = "thinkcenter";
          system = "x86_64-linux";
          machineConfiguration = ./hosts/machines/thinkcenter/configuration.nix;
        }
      ];

      linuxServerMachines = [ ];

      rPiMachines =
        let
          mkRpi3 = { machineName, machineConfiguration }: {
            name = "rpi3-" + machineName;
            value = nixpkgs.lib.nixosSystem {
              system = "aarch64-linux";
              specialArgs = inputs // {
                hostName = "rpi3-" + machineName;
              };
              modules = [
                "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
                nixos-hardware.nixosModules.raspberry-pi-3
                {
                  hardware.raspberry-pi.firmware.uboot.enable = true;
                  boot.supportedFilesystems.zfs = nixpkgs.lib.mkForce false;
                }
                machineConfiguration
              ];
            };
          };
        in
        map mkRpi3 [
          {
            machineName = "first";
            machineConfiguration = ./hosts/machines/rpi3/configuration.nix;
          }
        ];

      inherit (builtins) listToAttrs concatLists;

      mainSystem = "x86_64-linux";
      pkgs = import nixpkgs {
        system = mainSystem;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = listToAttrs (concatLists [
        linuxDesktopMachines
        linuxServerMachines
        rPiMachines
      ]);

      images.rpi3-first = self.nixosConfigurations.rpi3-first.config.system.build.sdImage;

      devShells.${mainSystem}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cowsay
          rpi-imager
        ];
        shellHook = ''
          echo "running"
          cowsay "Hii"
        '';
      };

    };
}

# add sops service, add 1password provider

# great start
# https://github.com/jackdbd/nix-config

# guy from the nix book!!
# https://github.com/ryan4yin/nix-config

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

  Modularisation
      Modularise big configs into their own files
      Organise modules by
           <System>/<DesktopEnv>
      Modularise OS/Hardware configuration

  Move to wayland:
    Walyland
    Waybar
    Waylock
    Hyperland
  Add desktop capabilities:
    I want to be able to get a menu of most used applications
    perhaps sort them in categories

  Configuration:
    Fix floating terminal in Neovim
    configure nushell
    Add transparency To neovim
    check stylix configs for:
      Firefox
      Grub
    Check if there are issues with NUR
      Need to install a few extensions

  add Kmonad to systems: rice it well

  I want a system wide notification system (Working in X11 or Wayland):
    I have heard of Dunst

  Add following programs:
    Glance
    Nix-icons
    sxiv
    Regreet
*/
