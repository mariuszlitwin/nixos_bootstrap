{ config, pkgs, ... }:

{
  imports = [
    ./cli.nix
    ./display.d/i3.nix
    ./display.d/lightdm.nix
  ];

  boot.initrd.kernelModules = [ "ipheth" ];

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
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

  programs.ssh.forwardX11 = true;

  environment = {
    sessionVariables = {
      TERMINAL = "termite -c /etc/xdg/termite/config";
    };
    shellAliases = {
      termite = "termite -c /etc/xdg/termite/config";
    };
    systemPackages = with pkgs; [
      alsaLib
      termite
      chromium firefox
      vlc
      gimp inkscape
      abiword antiword gnumeric
      scrot 
      arandr glxinfo xorg.xhost
      rfkill rfkill_udev
      keepassx2
      keybase-gui
      qbittorrent
    ];
  };

  environment.etc = {
    "xdg/termite/config".source = /etc/nixos/dotfiles/build/termite/config;
  };
  services.udev.extraRules = ''
    # Execute pairing program with iPhone
    ACTION=="add|remove", SUBSYSTEM=="net", ATTR{idVendor}=="05ac", ENV{ID_USB_DRIVER}=="ipheth", SYMLINK+="iphone", RUN+="${pkgs.systemd}/bin/systemctl restart systemd-networkd.service"
  '';
}
