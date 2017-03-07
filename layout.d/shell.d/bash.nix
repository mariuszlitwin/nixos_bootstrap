{ config, pkgs, ... }:

{
  imports = [
    ./alias.nix
  ];

  programs.bash = {
    enableCompletion = true;
  };

  environment.etc."bashrc.local" = {
    source = /etc/nixos/dotfiles/build/bashrc.local;
  };
}
