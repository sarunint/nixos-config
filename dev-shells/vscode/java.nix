{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage (
  {
    mkShell
  }:
  mkShell {
    # libraries here
    buildInputs =
      [
        pkgs.gradle
        pkgs.jdk21
      ];
    NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.stdenv.cc.cc
      pkgs.openssl
    ];
    NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; 
  }
) { }
