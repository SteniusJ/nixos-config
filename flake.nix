{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
  };

  outputs = { self, nixpkgs, hytale-launcher, ... }@inputs:
    let
      local = import /etc/nixos/local.nix;
    in {
    nixosConfigurations.steniusj = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs local;};
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        {
          environment.systemPackages = [
            hytale-launcher.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
