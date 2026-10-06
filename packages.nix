# This file manages installed packages

{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {};
  };

  # binary caches
  nix.settings = {
    substituters = [ "https://cache.nixos-cuda.org" ];
    trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
  };

  environment.systemPackages = with pkgs; [
    discord-canary
    kitty
    pear-desktop
    gimp
    btop
    kdePackages.dolphin
    kdePackages.kcalc
    rofi
    capitaine-cursors
    helix
    rustup
    davinci-resolve
    lldb
    gcc
    multiviewer-for-f1
    (ffmpeg-full.override { withUnfree = true; })
    protonup-qt
    wine
    razergenie
    (blender.override { cudaSupport = true; })
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    usbutils
    heroic
    prismlauncher
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
  ];
}
