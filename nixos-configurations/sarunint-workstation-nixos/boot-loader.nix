{ ... }:

{
  imports = [
    ../common/boot-loader.nix
  ];

  boot.loader.efi.efiSysMountPoint = "/efi";
  boot.loader.systemd-boot.xbootldrMountPoint = "/boot";
}