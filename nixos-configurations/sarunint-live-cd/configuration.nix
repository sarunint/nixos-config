{ modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix")
      ../common/kernel.nix
      ./wifi7.nix
      ./no-zfs.nix
    ];
  nixpkgs.hostPlatform = "x86_64-linux";
}
