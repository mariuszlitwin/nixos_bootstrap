{ config, pkgs, ... }

{
  options = {
    powerUser.groups = pkgs.lib.mkOption {
      default = [];
      type = with pkgs.lib.types; listOf string;
      description = "groups to which Power (main) User should be added; should be automatically updated by all nixos-bootstrap expressions; at the end can be concatenated with list of other desired groups in the final configuration";
    }
  }
}
