{ pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxKernel.packageAliases.linux_latest;
  specialisation.lts-linux.configuration = {
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  };
}
