{ inputs, ... }:

{
  environment.systemPackages = [
    inputs.winboat.packages.x86_64-linux.default
  ];
}