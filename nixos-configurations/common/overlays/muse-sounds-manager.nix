{ ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      muse-sounds-manager = super.muse-sounds-manager.overrideAttrs (final: prev: {
        version = "2.1.1.912";
        src = super.fetchurl {
          url = "https://web.archive.org/web/20251226185300if_/https://muse-cdn.com/Muse_Sounds_Manager_x64.tar.gz";
          hash = "sha256-fjdurAqOaiw8qUYm7oO8txHCKrrGSvvnmAxLU84IgSw=";
        };
      });
    })
  ]
  ;
}