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
    ./programs/kde-connect.nix
    ./programs/virt-manager.nix
    ./users/sarunint.nix
    ./hardware-clock.nix
    ./cloudflare-warp.nix
    ./ntfs.nix
    ./hyprland.nix
    ./java.nix
    ./firewall.nix
    ./mount-efi-partitions.nix
    ./yubikey.nix
    ./kde.nix
  ];
}