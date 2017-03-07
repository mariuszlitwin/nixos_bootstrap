{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./xserver.nix
  ];

  services.xserver = {
    windowManager = {
      i3 = {
        enable = true;
        configFile = "/etc/i3/i3.conf";
      };
      default = "i3";
    };
    desktopManager = {
      xterm.enable = false;
    };
  };
  
  environment.systemPackages = with pkgs; [
    i3status i3lock-color dmenu light
  ];
  environment.etc = {
    "i3/i3.conf".source = /etc/nixos/dotfiles/build/i3/i3.conf;
    "i3/i3status.conf".source = /etc/nixos/dotfiles/build/i3/i3status.conf;
  };
}
