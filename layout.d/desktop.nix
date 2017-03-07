{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ./display.d/i3.nix
    ./display.d/lightdm.nix
  ];

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  services.printing = {
    enable = true;
    gutenprint = true;
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Emoji One Color" ];
        sansSerif = [ "Emoji One Color" ];
        serif = [ "Emoji One Color" ];
      };
    };

    fonts = with pkgs; [
      corefonts vistafonts
      ubuntu_font_family
      dejavu_fonts
      font-awesome-ttf emojione
    ];
  };

  environment = {
    sessionVariables = {
      TERMINAL = "termite -c /etc/xdg/termite/config";
    };
    shellAliases = {
      termite = "termite -c /etc/xdg/termite/config";
    };
    systemPackages = with pkgs; [
      termite
      chromium firefox
      gimp inkscape
      scrot 
      xautolock arandr
      rfkill rfkill_udev
      keepassx2
      keybase
    ];
  };

  environment.etc = {
    "xdg/termite/config".source = /etc/nixos/dotfiles/build/termite/config;
  };
}
