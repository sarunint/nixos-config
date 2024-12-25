{ ... }:

{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  users.users.sarunint.extraGroups = [ "libvirtd" ];
}