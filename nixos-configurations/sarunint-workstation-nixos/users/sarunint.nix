{ ... }:

{
  imports = [
    ../../common/users/sarunint.nix
  ];

  users.users.sarunint.home = "/home/sarunint-nixos";
}