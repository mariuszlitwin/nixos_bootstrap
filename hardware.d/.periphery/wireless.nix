{ config, pkgs, ... };

{
  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;
    }
    networkmanager.enable = true;
  };
}
