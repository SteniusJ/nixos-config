{ local, pkgs, ... }:

{
  programs.mango.enable = true;
  programs.dconf.enable = true;
  programs.firefox.enable = true;
  programs.noctalia.enable = true;
  programs.git.enable = true;
  programs.yazi.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;  

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "nanotech";
      plugins = [ "git" ];
    };

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --impure --flake '/home/${local.username}/${local.nixos-config-location}#steniusj'";
      upgrade = "sudo nix flake update --flake /home/${local.username}/${local.nixos-config-location}";
      pkgs = "hx ~/${local.nixos-config-location}/packages.nix";
      nix-conf = "cd /home/${local.username}/${local.nixos-config-location}; ls";
      nix-shell = "nix-shell --run zsh";
      vr-hotspot-up = ''
        nmcli radio wifi on;
        nmcli connection up "VR Hotspot";
        '';
      vr-hotspot-down = ''
        nmcli connection down 'VR Hotspot';
        nmcli radio wifi off;
        '';
    };

    promptInit = ''
      if [[ -n "$IN_NIX_SHELL" ]]; then
        PROMPT="%F{red}%Bnix-shell%b%f %F{green}%2c%F{blue} [%f"
      fi
    '';
  };
  users.extraUsers.${local.username} = {
    shell = pkgs.zsh;
  };
}
