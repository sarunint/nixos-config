{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.rWrapper
  ];
}
