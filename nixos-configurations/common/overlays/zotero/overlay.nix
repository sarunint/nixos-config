self: super:
  let
    noOverride = builtins.hasAttr "firefox" super.zotero;
    firefox = super.callPackage ./firefox.nix { };
  in
    {
      zotero = super.lib.throwIf noOverride ''
        Zotero now has Firefox built-in. Please remove this overlay.
      ''
      super.zotero.overrideAttrs {
        buildPhase =
          let
            zoteroArch =
              platform:
              if platform.isAarch64 then
                "arm64"
              else if platform.isx86_64 then
                "x64"
              else if platform.isx86_32 then
                "i686"
              else
                platform.parsed.cpu.name;
          in
          ''
            runHook preBuild

            npm run build

            # Place firefox files at the right place.
            # The correct firefox version can be found in zotero/app/config.sh at `GECKO_VERSION_LINUX`.
            mkdir -p app/xulrunner/
          ''
          + super.lib.optionalString super.stdenv.hostPlatform.isDarwin ''
            cp -r "${firefox}/Applications/Firefox ESR.app" app/xulrunner/Firefox.app
          ''
          + super.lib.optionalString (!super.stdenv.hostPlatform.isDarwin) ''
            cp -r "${firefox}/lib/${firefox.libName}" "app/xulrunner/firefox-${super.stdenv.hostPlatform.parsed.kernel.name}-${
              super.lib.replaceString "aarch64" "arm64" super.stdenv.hostPlatform.parsed.cpu.name
            }"
          ''
          + ''
            chmod -R u+w app/xulrunner/

            build_dir=$(mktemp -d)
            ./app/scripts/prepare_build -s ./build -o "$build_dir" -c release
            ./app/build.sh -d "$build_dir" -c release -s \
              ${if super.stdenv.hostPlatform.isDarwin then "-p m" else "-p l -a ${zoteroArch super.stdenv.hostPlatform}"}

            runHook postBuild
          '';
      };
    }
