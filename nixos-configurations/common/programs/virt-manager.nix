{ pkgs, ... }:

{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };
  users.users.sarunint.extraGroups = [ "libvirtd" ];
}