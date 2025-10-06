{ ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      musescore = prev.musescore.overrideAttrs (oldAttrs: {
        version = "4.6.0";

        src = prev.fetchFromGitHub {
          owner = "musescore";
          repo = "MuseScore";
          rev = "v4.6.0";
          sha256 = "sha256-+Kmx+jMbBaIzXdulj5tsusF0x9b6tZ6jOTjI+sLP1jU=";
        };
      });
    })
  ];
}