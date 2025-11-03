{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      nix-output-monitor = prev.nix-output-monitor.overrideAttrs {
        patches = [
          (prev.fetchpatch2 {
            url = "https://github.com/maralorn/nix-output-monitor/commit/20758af18c6b5969ba5493bb3883031209e4364d.patch";
            hash = "sha256-unpJ+tZO2HLVion7vvhj+Xn2wFOzwxnqMohPIFACX+Q=";
          })
        ];
      };
    })
  ]
  ;
}