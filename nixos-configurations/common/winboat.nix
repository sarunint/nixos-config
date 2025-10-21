{ inputs, pkgs, ... }:

{
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.winboat.packages.x86_64-linux.winboat
    freerdp
  ];
}