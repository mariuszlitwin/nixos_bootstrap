{ config, pkgs, ... }:

{
  networking = {
    wireless.userControlled.enable = true;
  };
}
