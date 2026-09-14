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
        pkgs.nodejs_24
        pkgs.python3
      ];
  }
) { }
