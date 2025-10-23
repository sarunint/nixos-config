{ ... }:

{
   nixpkgs.overlays = [ (final: prev: 
    {
      musescore = prev.musescore.overrideAttrs {
        version = "4.6.3";
        src = prev.fetchFromGitHub {
          owner = "musescore";
          repo = "MuseScore";
          tag = "v4.6.3";
          hash = "sha256-WLzt/Ox6GrfWD0/l8/Ksc2ptg5LZSOXXnlsSnenfZtI=";
        };
        patches = [
          # Remove musescore > 4.6.3
          (prev.fetchpatch2 {
            url = "https://patch-diff.githubusercontent.com/raw/musescore/MuseScore/pull/30667.patch";
            hash = "sha256-FY2F3UqxXI5tNmKzMWJDxZ7gbXzxDcQzd8TTi2mGvrU=";
          })
          ../patches/musescore/0001-fix-import-CorePrivate.patch
          ../patches/musescore/0002-fix-import-GuiPrivate.patch
          (prev.fetchpatch2 {
            url = "https://patch-diff.githubusercontent.com/raw/musescore/MuseScore/pull/30422.patch";
            hash = "sha256-5v8CJfKC8RO9gzDfx0RjNkVElbIz9nmm8oPeN2o+NGA=";
          })
        ];

        env.NIX_CFLAGS_COMPILE = "-Wno-interference-size";
      };
    }
   ) ];
}