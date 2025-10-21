{ inputs, ... }:

{
  imports = [ inputs.winboat.nixosModules.x86_64-linux.default ];
  services.winboat.enable = true;
}