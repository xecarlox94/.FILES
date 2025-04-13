
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/modularize-the-configuration

{
  description = "A very basic flake";

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

  outputs = { nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations = {

      # https://github.com/r6t/nixos-r6t/blob/095660382e3596ecff6555f6b8f77d4272ea4b27/flake.nix#L66

      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };

        modules = [

          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # https://github.com/r6t/nixos-r6t/blob/main/modules/home/home-manager/default.nix
            # sharedModules = [
              # inputs.nixvim.homeManagerModules.nixvim
            # ];

            home-manager.users.xecarlox = {
              imports = [
                inputs.nixvim.homeManagerModules.nixvim
                ./home.nix
              ];
            };
          }
        ];
      };

    };

  };
}
