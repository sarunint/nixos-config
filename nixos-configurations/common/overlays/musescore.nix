self: super: 
{
  musescore = super.musescore.overrideAttrs (final: prev: {

    preConfigure = ''
      substituteInPlace src/framework/media/internal/ffmpegutils.cpp \
        --replace-fail "/usr/lib/x86_64-linux-gnu" "${super.lib.getLib super.ffmpeg_8}/lib" \
        --replace-fail "/opt/homebrew/lib" "${super.lib.getLib super.ffmpeg_8}/lib" \
    '';
  });
}
