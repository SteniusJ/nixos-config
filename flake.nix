{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      local = import /etc/nixos/local.nix;
    in {
    nixosConfigurations.steniusj = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs local;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
