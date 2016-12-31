{ config, pkgs, ... }:

{
  powerUser.groups = ["audio"];

  hardware.pulseaudio.enable = true;
  system.environmentPackages = with pkgs; [
    alsaUtils 
  ];
}
