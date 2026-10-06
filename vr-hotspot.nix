# Module for VR headset connection without wifi access point.

{ config, local, ... }:

{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  networking.firewall.allowedUDPPorts = [
    53
    67
  ];

  networking.networkmanager.ensureProfiles.profiles.vr-hotspot = {
    connection = {
      id = "VR Hotspot";
      type = "wifi";
      interface-name = "wlp13s0";
      autoconnect = false;
    };

    wifi = {
      mode = "ap";
      ssid = "VR-PC";
      band = "a";
      channel = 36;
      channel-width = 80;
    };

    wifi-security = {
      key-mgmt = "wpa-psk";
      proto = "rsn";
      pairwise = "ccmp";
      group = "ccmp";
      psk = local.vr-hotspot-passwd;
    };

    ipv4 = {
      method = "shared";
    };

    ipv6 = {
      method = "disabled";
    };
  };
}
