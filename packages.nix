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
    (btop.overrideAttrs (oldAttrs: rec {
      cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [
        "-DBTOP_GPU=ON"
      ];
    }))
    kdePackages.dolphin
    kdePackages.kcalc
    rofi
    capitaine-cursors
    helix
    rustup
    ly
    upower #laptop battery widget recognition
    davinci-resolve
    lldb
    gcc
    multiviewer-for-f1
    (ffmpeg-full.override { withUnfree = true; })
    protonup-qt
    wine
    razergenie
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
  ];
}
