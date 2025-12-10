{ lib, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      musescore = super.musescore.overrideAttrs (final: prev: {
        version = "4.6.4";
        patches = [];
        src = prev.src.override {
          hash = "sha256-fBkokokyCJcwYRgdrtWQEqW1rcdlmVQu1OrMJeKA8Sc=";
        };
      });
    })
  ]
  ;
}