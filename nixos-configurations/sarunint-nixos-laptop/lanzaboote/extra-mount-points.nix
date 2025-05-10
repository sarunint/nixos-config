{ ... }: {
  fileSystems = {
    "/efi/EFI/Linux" = { device = "/boot/EFI/Linux"; options = ["bind"];};
    "/efi/EFI/nixos" = { device = "/boot/EFI/nixos"; options = ["bind"];};
  };
}