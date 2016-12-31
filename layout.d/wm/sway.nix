{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wayland sway dmenu-wayland
  ];
}
