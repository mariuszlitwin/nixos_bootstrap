{ config, pkgs, ... };

{
  imports = [
    ../.periphery/audio.nix
    ../.periphery/batter.nix
    ../.periphery/wireless.nix
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

  hardware.opengl = {
    videoDrivers = [ "intel" ];
    driSupport32Bit = true;
  };
}
