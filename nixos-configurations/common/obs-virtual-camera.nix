{ pkgs, lib, config, ... }:

{
  boot = {
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = let
      sections = builtins.length (lib.strings.splitString "." config.boot.kernelPackages.kernel.version);
      version = if sections == 3 then config.boot.kernelPackages.kernel.version else "${config.boot.kernelPackages.kernel.version}.0";
      v4l2loopback-workaround = pkgs.runCommand "v4l2loopback-workaround" { } ''
        subdir=lib/modules/${version}
        mkdir -p $out/$subdir
        cd ${config.boot.kernelPackages.v4l2loopback}/$subdir
        for f in *; do
          if [[ $f =~ ^modules ]]; then continue; fi
          cp -r $f $out/$subdir/$f
        done
      '';
    in
      [ v4l2loopback-workaround ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}