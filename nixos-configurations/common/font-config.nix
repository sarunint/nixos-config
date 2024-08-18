{ ... }:

{
  fonts.fontconfig.localConf = ''
    <match>
      <test compare="contains" name="lang">
        <string>th</string>
      </test>
      <edit mode="prepend" name="family">
        <string>Noto Sans Thai Looped</string>
      </edit>
    </match>
  '';
}