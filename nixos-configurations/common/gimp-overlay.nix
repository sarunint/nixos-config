{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      gimp = prev.gimp.overrideAttrs {
        preAutoreconf = ''
          cp ${pkgs.gettext}/share/gettext/m4/nls.m4 m4macros
        '';
      };
    })
  ];
}