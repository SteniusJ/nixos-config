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
      upgrade = "sudo nix flake update";
    };
  };
  users.extraUsers.${local.username} = {
    shell = pkgs.zsh;
  };
}
