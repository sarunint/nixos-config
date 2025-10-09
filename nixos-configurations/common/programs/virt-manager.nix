{ ... }:

{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
    };
  };
  users.users.sarunint.extraGroups = [ "libvirtd" ];
}