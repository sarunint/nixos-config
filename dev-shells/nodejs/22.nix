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
        pkgs.nodejs_22
        pkgs.python3
      ];
  }
) { }
