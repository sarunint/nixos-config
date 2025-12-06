{ ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      rquickshare = super.rquickshare.overrideAttrs (final: prev: {
        patches = prev.patches ++ [./../patches/rquickshare/fix-pnpm-lock-file-tauri-minor-verison-mismatch.patch];
        pnpmDeps = prev.pnpmDeps.override {
          patches = final.patches;
          hash = "sha256-VbdMaIEL1e+0U+ny4qbk1Mmkuc3cahKakKKYowCBK5Q=";
        };
      });
    })
  ];
}