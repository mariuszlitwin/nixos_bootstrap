{ config, pkgs, ... }:

{
  hardware.pulseaudio.enable = true;
  environment.systemPackages = with pkgs; [
    alsaUtils
  ];
}
