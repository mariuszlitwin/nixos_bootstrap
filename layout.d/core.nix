{ config, pkgs, ... }:

{
  time.timeZone = "UTC";

  nix.useSandbox = true;
  nix.buildCores = 0;
  nixpkgs.config.allowUnfree = true;
  security.sudo.enable = true;

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  services.locate.enable = true;
  services.haveged.enable = true;

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
  };

  environment = {
    sessionVariables = {
      EDITOR = "vim";
      PYTHONDONTWRITEBYTECODE = "1";
    };
    # Basic packages
    systemPackages = with pkgs; [
      iptables 
      file
      zip unzip unrar p7zip 
      wget curl
      vim 
      gitFull
      w3m
      nix-repl
      mc
      jq
      gnupg20
    ];
  };
}
