{ pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxKernel.packagesFor (pkgs.linuxKernel.kernels.linux_6_19.override (oldAttrs: {
    kernelPatches = oldAttrs.kernelPatches ++ [
      {
        name = "fix-iommu";
        patch = pkgs.fetchpatch2 {
          url = "https://lore.kernel.org/linux-iommu/20260227080638.208693-1-lkml@antheas.dev/raw";
          hash = "sha256-22mhO6KV2tr6Glhdlwq5yHPklsdtVR+NPP+KeU9fEQA=";
        };
      }
    ];
  }));
  specialisation.lts-linux.configuration = {
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  };
}
