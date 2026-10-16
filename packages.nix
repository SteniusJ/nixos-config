# This file manages installed packages

{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {};
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
    ly
    davinci-resolve
    lldb
    gcc
    multiviewer-for-f1
    (ffmpeg-full.override { withUnfree = true; })
    protonup-qt
    wine
    affinity-v3 #from flake
    libreoffice
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
  ];
}
