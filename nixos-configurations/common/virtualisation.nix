{ ... }:

{
  virtualisation.podman.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 4;
      diskSize = 20 * 1024;
    };
  };
}