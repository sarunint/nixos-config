{ ... }: {
  fileSystems = {
    "/efi/EFI/Linux" = { device = "/boot/EFI/Linux"; options = ["bind"]; fsType = "auto";};
    "/efi/EFI/nixos" = { device = "/boot/EFI/nixos"; options = ["bind"]; fsType = "auto";};
  };
}