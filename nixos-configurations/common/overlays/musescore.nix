self: super: 
{
  musescore = super.musescore.overrideAttrs (final: prev: {

    preConfigure = ''
      substituteInPlace src/framework/media/internal/ffmpegutils.cpp \
        --replace-fail "/usr/lib/x86_64-linux-gnu" "${super.lib.getLib super.ffmpeg_8}/lib" \
        --replace-fail "/opt/homebrew/lib" "${super.lib.getLib super.ffmpeg_8}/lib" \
    '';

    patches = prev.patches ++ [
      (super.fetchpatch2 {
        url = "https://raw.githubusercontent.com/NixOS/nixpkgs/4ee93bdc2feab5fda72b4f1115572793670b7c22/pkgs/by-name/mu/musescore/qmlcachegen-unity-build.diff";
        hash = "sha256-v2MS1hKFCIEdC8DX/uiAXrV2IvypmsgluNIU0HTuo94=";
      })
    ];
  });
}
