{ ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "sarunint" ];
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
}