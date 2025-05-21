
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/modularize-the-configuration

{
  description = "Local machine configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

    mkMachine = hostName: systemArch: machineConfiguration: 
      nixpkgs.lib.nixosSystem {

        system = systemArch;

        # TODO: pass input configuration to all other modules

        specialArgs = inputs // { inherit hostName; }; 

          # TODO: create small nix library to help write functionality

        modules = [
          
          machineConfiguration

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # TODO: add special arguments to all home manager modules

            home-manager.extraSpecialArgs = {
              inherit hostName;
              utils = import ./lib;
            };

            home-manager.users.xecarlox = {
              imports = [
                ./home/home.nix
                inputs.nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };

  in {

    nixosConfigurations = {

      # TODO: prepare MacOs configuration adapter

      nixos = mkMachine "nixos" "x86_64-linux" ./machines/laptop-hp/configuration.nix;

    };

  };
}
