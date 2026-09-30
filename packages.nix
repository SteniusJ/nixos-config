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
    btop
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
    noisetorch
    davinci-resolve
    lldb
    gcc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
