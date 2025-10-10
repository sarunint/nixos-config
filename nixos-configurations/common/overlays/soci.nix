{ ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      soci = prev.soci.overrideAttrs (oldAttrs: {
        cmakeFlags = oldAttrs.cmakeFlags ++
          [
            "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
          ];
      });
    })
  ];
}