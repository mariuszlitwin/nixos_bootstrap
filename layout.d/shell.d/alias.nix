{ config, pkgs, ... }:

{
  environment.shellAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
  };
}
