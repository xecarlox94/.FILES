
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

    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    # nix-doom-emacs-unstraightened.inputs.nixpkgs.follows = "";

  };


  # TODO: use flake utils to create configuration for multiple hosts
  #
  #   MacOs module should only install tooling, no desktop environment


  outputs = { nixpkgs, home-manager, ... }@inputs:
  let

    # TODO: modularise keybindings for IDEs
    # TODO: modularise environment variables
    # TODO: modularise environment aliases
    # TODO: modularise environment functions
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
                ./home/home.nix
                inputs.nixvim.homeManagerModules.nixvim
                  # inputs.nix-doom-emacs-unstraightened.homeModule
              ];
            };
          }
        ];
      };

  in {

    nixosConfigurations = {

      # TODO: prepare MacOs configuration adapter

      nixos = mkLinuxMachine "nixos" "x86_64-linux" ./machines/laptop-hp/configuration.nix;

      thinkcenter = mkLinuxMachine "thinkcenter" "x86_64-linux" ./machines/thinkcenter/configuration.nix;
    };

  };
}
