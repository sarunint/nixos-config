{ ... }:

{
  programs.virt-manager.enable = true;
  users.users.sarunint.extraGroups = [ "libvirtd" ];
}