{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;
  };

  environment = {
    systemPackages = with pkgs; [
      xsel
    ];

    etc = {
      "X11/xresources".source = /etc/nixos/dotfiles/xresources;
      "X11/xinitrc".source = /etc/nixos/dotfiles/xinitrc;
    };

    extraInit = ''
      source /etc/X11/xinitrc
    '';
  };
}
