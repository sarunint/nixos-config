{ git, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      linux-firmware = prev.linux-firmware.overrideAttrs {
        postPatch = "cp $binPatches/amss.bin $TMPDIR/source/ath12k/WCN7850/hw2.0/amss.bin && cp $binPatches/m3.bin $TMPDIR/source/ath12k/WCN7850/hw2.0/m3.bin";
        binPatches = ./patches;
      };
    })
  ];
}