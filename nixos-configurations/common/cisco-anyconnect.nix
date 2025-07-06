{ pkgs, ... }:
{
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openconnect
  ];
}