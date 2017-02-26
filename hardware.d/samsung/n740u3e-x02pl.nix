{ config, pkgs, ... }:

{
  imports = [
    ../periphery/audio.nix
    ../periphery/battery.nix
    ../periphery/wireless.nix
    ../periphery/backlight.nix
  ];

  boot.kernelModules = [
    "fuse"
  ];
  boot.kernelParams = [
    # I've heard it's better scheduler for SSD
    "elevator=noop"
  ];
  boot.blacklistedKernelModules = [ 
    "fbcon"
  ];
  
  services.xserver.synaptics = {
    enable = true;
    tapButtons = true;

    twoFingerScroll = true;
    horizEdgeScroll = false;
    vertEdgeScroll = false;
    vertTwoFingerScroll = true;
    horizTwoFingerScroll = true;

    palmDetect = true;
    palmMinWidth = 8;
    palmMinZ = 100;
  };

  services.xserver.videoDrivers = [ "intel" ];
}
