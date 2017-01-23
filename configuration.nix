# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./bootstrap.nix
    ./hardware.d/samsung/n740u3e-x02pl.nix
    ./layout.d/wm/sway.nix 
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];
  boot.plymouth = {
    enable = true;
  };
  
  # Basic Nix
  nix.useSandbox = true;
  nixpkgs.config.allowUnfree = true;
  security.sudo.enable = true;

  # Networking
  networking = {
    hostName = "skynet";
    interfaceMonitor.enable = true;
    wireless.userControlled.enable = true;
  };

  # Locale
  i18n = {
    consoleKeyMap = "pl";
    defaultLocale = "en_GB.UTF-8";
  };
  time.timeZone = "UTC";

  # Basic packages
  environment.systemPackages = with pkgs; [
    wget vim gitAndTools.gitFull firmwareLinuxNonFree
  ];

  # Users
  users.extraUsers.mlitwin = {
    description = "Mariusz Litwin";
    createHome = true;
    home = "/home/mlitwin";
    group = "users";
    extraGroups = powerUser.groups ++ [ "wheel" ];
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";
}
