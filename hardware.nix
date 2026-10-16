# This file defines enabled hardware features

{ config, local, pkgs, ... }:

{
  hardware.facter.reportPath = /home/${local.username}/${local.nixos-config-location}/facter.json;
  
  # # Enable bluetooth
  # hardware.bluetooth.enable = true;
  
   # Enable hardware accelerated graphics
   hardware.graphics = {
     enable = true;
     enable32Bit = true;
     extraPackages = with pkgs; [
       intel-media-driver
       vpl-gpu-rt
       intel-compute-runtime
     ];
   };

   # Load Intel Drivers
   services.xserver.videoDrivers = [ "modesetting" ];

   environment.sessionVariables = {
     LIBVA_DRIVER_NAME = "iHD";
   };

   hardware.enableRedistributableFirmware = true;
   boot.kernelParams = [ "i915.enable_guc=3" ];
}
