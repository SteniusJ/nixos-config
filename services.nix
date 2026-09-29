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

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
  };
  users.extraUsers.${local.username} = {
    shell = pkgs.zsh;
  };
}
