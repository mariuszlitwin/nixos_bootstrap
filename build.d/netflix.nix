{
  network.description = "host-limited network";
  cbase = { config, pkgs, ... }:
  
  {
    imports = [
      ../layout.d/display.d/theme.nix
      ../layout.d/display.d/xserver.nix
    ];

    networking.hostName = "netflix";

    services.openssh = {
      enable = true;
      allowSFTP = false;
      forwardX11 = true;
    };

    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      google-chrome
    ];

    users.users.netflix = {
      description = "Really chilled user";
      createHome = true;
      home = "/home/netflix";
      group = "users";
      password = "netflix";
      uid = 1000;
      useDefaultShell = true;
    };
  };
}
