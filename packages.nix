# This file manages installed packages

{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {};
  };

  environment.systemPackages = with pkgs; [
    steam
    discord-canary
    noctalia
    firefox
    zsh
    git
    greetd
    tuigreet
    kitty
    pear-desktop
    gimp
    yazi
    (btop.overrideAttrs (oldAttrs: {
      cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [
        "-DBTOP_GPU=ON"
      ];
    }))
    kdePackages.dolphin
    kdePackages.kcalc
    rofi
    mango
    capitaine-cursors
    helix
    rustup
    oh-my-zsh
    ly
    upower #laptop battery widget recognition
    davinci-resolve
    lldb
    gcc
    multiviewer-for-f1
    (ffmpeg-full.override { withUnfree = true; })
    protonup-qt
    wine
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
  ];
}
