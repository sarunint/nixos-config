self: super:
  let
    noOverride =
      super.lib.versionOlder "6.31.0" super.kdePackages.baloo.version;
  in
    {
      kdePackages = super.lib.throwIf noOverride ''
        KDE Framework has been updated to greater than 6.31.0, this overlay should be removed.
      ''
      super.kdePackages // {
        baloo = super.kdePackages.baloo.overrideAttrs {
          patches = [
            (super.fetchpatch2 {
              url = "https://invent.kde.org/frameworks/baloo/-/commit/096b0d3f7166ed2bde0266cfad9f04ca50903090.patch";
              hash = "sha256-S2zV9nJ007mG0+r9H8X3R2O6VcwddXdwPknlnaaBiDg=";
            })
            (super.fetchpatch2 {
              url = "https://invent.kde.org/frameworks/baloo/-/commit/a5431882c8cb36116907f59c97b0d2d92a7fe543.patch";
              hash = "sha256-mjTt5M7rtpW8tAgtCWswG/Q0GRIVvbOm+62behSSfkI=";
            })
          ];
        };
      };
    }
