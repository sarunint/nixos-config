{ ... }:

{
  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;
  boot.kernelParams = [ "snd-intel-dspcfg.dsp_driver=1" ];
}