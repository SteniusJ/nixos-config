# This file defines enabled services

{ config, pkgs, local, ... }:

{
  programs.mango.enable = true;
  services.displayManager = {
    ly.enable = true;
    sessionPackages = [pkgs.mango];
    defaultSession = "mango";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  
  services.upower.enable = true;

  programs.noisetorch.enable = true;

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --impure --flake '/home/${local.username}/${local.nixos-config-location}#steniusj'";
      upgrade = "sudo nix flake update";
    };
  };
  users.extraUsers.${local.username} = {
    shell = pkgs.zsh;
  };
}
