{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [];

  buildInputs = with pkgs; [];

  # Env variables as their own variables
  # TEST = "test string"; <-- creates TEST env variable
}
