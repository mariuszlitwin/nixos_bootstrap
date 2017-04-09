{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
  ];

  nixpkgs.config = {
    virtualbox = {
      pulseSupport = true;
    };
  };

  virtualisation.virtualbox.host = {
    enable = true;
    enableHardening = true;
    addNetworkInterface = true;
  };

  environment.systemPackages = with pkgs; [
    gmp
  ];
}
