{ gettext, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      gimp = prev.gimp.overrideAttrs {
        preAutoreconf = ''
          cp ${gettext}/share/gettext/m4/nls.m4 m4macros
        '';
      };
    })
  ];
}