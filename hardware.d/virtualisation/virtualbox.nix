{ config, pkgs, ... }:

{
  virtualisation.virtualbox.guest.enable = true;
   
  # Disabled due to known issue with always-dirty filesystem
  boot.initrd.checkJournalingFS = false;
}
