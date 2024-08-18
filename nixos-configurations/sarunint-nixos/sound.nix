{ ... }:

{
  imports = [
    ../common/sound.nix
  ];
  boot.kernelParams = [ "snd-intel-dspcfg.dsp_driver=1" ];
}