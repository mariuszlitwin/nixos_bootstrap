{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      adapta-gtk-theme
      breeze-qt4 breeze-qt5 breeze-gtk
      gnome3.adwaita-icon-theme
    ];
    
    sessionVariables = {
      GTK2_RC_FILES = "${pkgs.breeze-gtk}/share/themes/Breeze-Dark/gtk-2.0/gtkrc";
      GTK_THEME = "Breeze:dark";
    };
  };

  # boot.plymouth.themePackages = with pkgs; [ breeze-plymouth ];

  services.xserver.displayManager.lightdm = {
    background = "#31363b";
    greeters.gtk = {
      theme = {
        name = "Adapta";
        package = pkgs.adapta-gtk-theme;
      };
    };
  };
}
