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
        pkgs.nodejs_20
        pkgs.python3
      ];
  }
) { }
