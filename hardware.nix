# This file defines enabled hardware features

{ config, local, ... }:

{
  hardware.facter.reportPath = /home/${local.username}/${local.nixos-config-location}/facter.json;
  
  # # Enable bluetooth
  # hardware.bluetooth.enable = true;
  
  # # Enable hardware accelerated graphics
  # hardware.graphics = {
  #   enable = true;
  # };

  # # Load Nvidia Drivers
  # # services.xserver.videoDrivers = [ "nvidia" ];
  #
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = false;
  #   powerManagement.finegrained = false;
  #   open = false; # May want to change this to true
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
}
