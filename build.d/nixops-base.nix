let
  cbase =
    { config, pkgs, ... }:
    {
      deployment = {
        targetEnv = "virtualbox";
        virtualbox = {
          memorySize = 1024;
          headless = true;
        };
      };
      virtualisation.virtualbox.guest.enable = true;
    };
in
{
  network.enableRollback = true;
  inherit cbase;
}
