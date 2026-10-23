self: super: {
  kernelPackagesExtensions = super.kernelPackagesExtensions ++ [
    (
      lself: lsuper: {
        v4l2loopback = lsuper.v4l2loopback.overrideAttrs (final: prev: {
          preBuild = "";
          installFlags = [
            "DEPMOD=true"
            "INSTALL_MOD_PATH=${placeholder "out"}"
          ];
        });
      }
    )
  ];
}
