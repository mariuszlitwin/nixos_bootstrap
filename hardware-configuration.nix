# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/358659ff-f3a6-40f1-8afd-db7752ce375d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/09A1-B1EE";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/cbb5b03f-3ece-43a2-9717-c4ebe78137b8"; }
    ];

  nix.maxJobs = lib.mkDefault 4;
}
