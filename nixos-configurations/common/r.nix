{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.rWrapper
    pkgs.rstudioWrapper
  ];
}
