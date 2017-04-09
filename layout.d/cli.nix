{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      nixops
      xautolock
      rfkill rfkill_udev
      keybase kbfs
      rtorrent
      alpine w3m elinks
      irssi cmus
    ];
  };
}
