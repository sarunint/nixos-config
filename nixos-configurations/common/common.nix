{ ... }:

{
  imports = [
    ./boot-loader.nix
    ./desktop.nix
    ./disable-mutable-users.nix
    ./flatpak.nix
    ./font-config.nix
    ./kernel.nix
    ./locale.nix
    ./nix-config.nix
    ./packages.nix
    ./sound.nix
    ./timezone.nix
    ./unfree.nix
    ./programs/gnupg.nix
    ./users/sarunint.nix
    ./hardware-clock.nix
    ./cloudflare-warp.nix
    ./ntfs.nix
  ];
}