# Nixos Config
My Nixos PC config

## Initial steps
This configuration assumes that the files are kept in a directory in you home directory.
Create a symbolic link from your configuration.nix in your home directory to /etc/nixos/configuration.nix
in order to keep your files at home.


This config relies on a local.nix file which defines user variables
like username, hostname, email etc. A example file is provided "local.nix.example".
Populate this file and move it to /etc/nixos/local.nix which is where it is read from by default,
the location can be changed in the flake.nix file.


This config relies on facter.nix for hardware configuration.
The config is read by default from your nixos-config-location defined in your
local.nix file.

run "sudo nix-shell -p nixos-facter --run 'nixos-facter -o facter.json'"
in your config location to generate the facter hardware config file.

## Commands
To update use the usual commands for updating flakes "nix flake update"


To rebuild system use this command "nixos-rebuild switch --impure --flake '$HOME/{your config location}#steniusj'"
