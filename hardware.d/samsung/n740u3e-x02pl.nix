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
  
  services.xserver.libinput = {
    enable = true;
    disableWhileTyping = true;
    tapping = true;
    tappingDragLock = true;
    middleEmulation = true;
    naturalScrolling = true;
    scrollMethod = "twofinger";
  };

  services.xserver.videoDrivers = [ "intel" ];
}
