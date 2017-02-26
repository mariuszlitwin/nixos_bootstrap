{ config, pkgs, ... }:

{
  imports = [
    ./gtk.nix
    ./xserver.nix
  ];
  
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "#1E1E1E";
    greeters.gtk.enable = true;
  };
}
