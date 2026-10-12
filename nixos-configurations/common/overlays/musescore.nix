self: super: 
  let
    noOverride = super.lib.versionAtLeast super.musescore.version "4.7.5";
  in
    {
      musescore = super.lib.warnIf noOverride ''
        MuseScore Studio >= 4.7.5 is now in nixpkgs, the overlay can be removed.
      ''
      super.musescore.overrideAttrs (final: prev: {
        version = "4.7.5";
        src = prev.src.overrideAttrs {
          hash = "sha256-WzVsItF4cyhd99Ax0BWkiX3JoxPY9+xpag7fu8yORD0=";
        };

        preConfigure = ''
          substituteInPlace src/framework/media/internal/ffmpegutils.cpp \
            --replace-fail "/usr/lib/x86_64-linux-gnu" "${super.lib.getLib super.ffmpeg_8}/lib" \
            --replace-fail "/opt/homebrew/lib" "${super.lib.getLib super.ffmpeg_8}/lib" \
        '';
      });
    }
