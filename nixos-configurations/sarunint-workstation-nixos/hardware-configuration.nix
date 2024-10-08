# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/78acd0db-debb-48f0-ae54-59763f449b11";
      fsType = "btrfs";
      options = [ "subvol=root" "noatime" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/a89da321-dc68-4037-8224-798671707951";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D332-5EC4";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/78acd0db-debb-48f0-ae54-59763f449b11";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd" ];
    };

  fileSystems."/var/lib" =
    { device = "/dev/disk/by-uuid/78acd0db-debb-48f0-ae54-59763f449b11";
      fsType = "btrfs";
      options = [ "subvol=var-lib" "noatime" "compress=zstd" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/78acd0db-debb-48f0-ae54-59763f449b11";
      fsType = "btrfs";
      options = [ "subvol=var-log" "noatime" "compress=zstd" ];
    };

  fileSystems."/var/tmp" =
    { device = "/dev/disk/by-uuid/78acd0db-debb-48f0-ae54-59763f449b11";
      fsType = "btrfs";
      options = [ "subvol=var-tmp" "noatime" "compress=zstd"];
    };

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/2A93-DE7A";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/harddisk" = 
    {
      device = "/dev/disk/by-uuid/584C-6C26";
      fsType = "exfat";
      options = [ "uid=sarunint" "gid=users" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9135cf87-24a1-4464-9586-b4967cde6e22"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp14s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp19s0u1u2i2.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

