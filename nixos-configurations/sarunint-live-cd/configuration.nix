{ modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix")
      ../common/kernel.nix
      ./wifi7.nix
    ];
}
