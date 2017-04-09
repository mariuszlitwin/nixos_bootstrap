{ config, pkgs, ... }:

{
  environment.shellAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    termite = "termite -c /etc/xdg/termite/config";
    gpg = "gpg2";
    sysrebuild = "sudo perl /etc/nixos/dotfiles/rebuild.pl && sudo nixos-rebuild";
    python-shell = "nix-shell -p python -p python27Packages.virtualenv -p python27Packages.pip";
    python3-shell = "nix-shell -p python3 -p python35Packages.virtualenv -p python35Packages.pip";
  };
}
