{ pkgs, ... }:

{
  services.keybase.enable = true;
  environment.systemPackages = [
    pkgs.keybase-gui
  ];
}