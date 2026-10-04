# This file defines enabled services

{ config, pkgs, local, ... }:

{
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
    configPackages = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  
  #services.upower.enable = true;
}
