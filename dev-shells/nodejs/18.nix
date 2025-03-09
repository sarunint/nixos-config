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
        pkgs.nodejs_18
        pkgs.python3
      ];
  }
) { }
