# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
    ../hardware.d/samsung/n740u3e-x02pl.nix
    ../layout.d/shell.d/bash.nix
    ../layout.d/power.nix
    ../layout.d/netflix.nix
    ../password.secret.nix
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

  # Networking
  networking.hostName = "skynet";

  # Locale
  i18n.defaultLocale = "pl_PL.UTF-8";
  i18n.consoleKeyMap = "pl";
  services.xserver.layout = "pl";
  # Users
  users.users.mlitwin = {
    description = "Mariusz Litwin";
    createHome = true;
    home = "/home/mlitwin";
    group = "users";
    extraGroups = [ "audio" "wheel" "vboxusers" "systemd-journal" ];
    uid = 1000;
    useDefaultShell = true;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "unstable";
}
