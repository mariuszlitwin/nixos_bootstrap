{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      paper-gtk-theme paper-icon-theme
    ];
    
    sessionVariables = {
      GTK2_RC_FILES = "/etc/gtk-2.0/gtkrc";
    };

    etc = {
      "gtk-2.0/gtkrc".source = /etc/nixos/dotfiles/gtk-2.0/gtkrc;
    };
  };

  services.xserver.displayManager.lightdm.greeters.gtk = {
    theme = {
      name = "Paper";
      package = pkgs.paper-gtk-theme;
    };
    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };
  };
}
