
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


  # https://github.com/r6t/nixos-r6t/blob/main/hosts/saguaro/configuration.nix

  # make host like this

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let

    
    mkMachine = systemArch: machineConfiguration: 
      nixpkgs.lib.nixosSystem {

        system = systemArch;

        specialArgs = { inherit inputs; };

        modules = [
          
          machineConfiguration

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.xecarlox = {
              imports = [
                ./home.nix
                inputs.nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };

  in {

    nixosConfigurations = {

      nixos = mkMachine "x86_64-linux" ./configuration.nix;


    };

  };
}
