{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxKernel.packageAliases.linux_latest;
}