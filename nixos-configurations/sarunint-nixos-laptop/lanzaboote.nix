{ pkgs, lib, ... }: {
  environment.systemPackages = [
    pkgs.sbctl
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  fileSystems = {
    "/efi/EFI/Linux" = { device = "/boot/EFI/Linux"; options = ["bind"];};
    "/efi/EFI/nixos" = { device = "/boot/EFI/nixos"; options = ["bind"];};
  };
}