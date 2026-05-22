{
  pkgs ? import <nixpkgs> { },
}:
let
  runtimeLibs = [
    pkgs.gradle
    pkgs.jdk25
    pkgs.libglvnd
    pkgs.flite
    pkgs.alsa-lib
    pkgs.libjack2
    pkgs.libpulseaudio
    pkgs.pipewire
  ];
in
  pkgs.mkShell {
    # libraries here
    buildInputs = runtimeLibs;
    shellHook = ''
      export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${toString (pkgs.lib.makeLibraryPath runtimeLibs)}";
    '';
  }
