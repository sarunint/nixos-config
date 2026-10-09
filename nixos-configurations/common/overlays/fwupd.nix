self: super: {
  fwupd = super.fwupd.overrideAttrs (final: prev: {
    mesonFlags = map (
      flag: if self.lib.hasPrefix "-Defi_app_location=" flag then "-Defi_app_location=/run/fwupd-efi" else flag
    ) prev.mesonFlags;
  });
}
