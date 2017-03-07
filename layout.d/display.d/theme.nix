{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      kde5.breeze kde5.breeze-grub kde5.breeze-gtk kde5.breeze-icons kde5.breeze-plymouth
    ];
    
    sessionVariables = {
      GTK2_RC_FILES = "${pkgs.kde5.breeze-gtk}/share/themes/Breeze-Dark/gtk-2.0/gtkrc";
      GTK_THEME = "Breeze:dark";
    };
  };

  # boot.plymouth.themePackages = [ pkgs.kde5.breeze-plymouth ];

  services.xserver.displayManager.lightdm = {
    background = "#1e1e1e";
    greeters.gtk = {
      theme = {
        name = "Breeze-Dark";
        package = pkgs.kde5.breeze-gtk;
      };
    };
  };
}
