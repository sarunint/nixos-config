{
  description = "SarunInt's flake for NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    prism-meta = {
      url = "github:PrismLauncher/meta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } ({ ... } @ top: {
      systems = [
        "x86_64-linux"
      ];
      perSystem = { system, pkgs, self', ... }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        packages = {
          ferium = pkgs.ferium.overrideAttrs {
            patches = [
              ./nixos-configurations/common/patches/ferium.patch
            ];
          };
          musescore-appimage = let 
            pname = "musescore-appimage";
            version = "4.6.5";
            buildNumber = "253511702";
            src = pkgs.fetchurl {
              url = "https://cdn.jsdelivr.net/musescore/v${version}/MuseScore-Studio-${version}.${buildNumber}-x86_64.AppImage";
              hash = "sha256-GT2qDqGLz6kKRxRahCJ1uAabeyuNFT5WKxX6tf5Q/K8=";
            };
            appimageContents = pkgs.appimageTools.extractType2 { inherit pname version src; };
          in
            pkgs.appimageTools.wrapType2 {
              inherit pname version src;

              extraInstallCommands = ''
                install -Dm444 ${appimageContents}/share/applications/org.musescore.MuseScore4portable.desktop -t $out/share/applications
                substituteInPlace $out/share/applications/org.musescore.MuseScore4portable.desktop \
                  --replace-fail 'Exec=mscore4portable %U' 'Exec=${pname}'
                cp -r ${appimageContents}/share/icons $out/share
              '';
            };
          ivao-aurora = let 
            pname = "ivao-aurora";
            version = "0.0.0";
            src = pkgs.fetchurl {
              url = "https://web.archive.org/web/20260124193912if_/https://download.ivao.aero/v2/softwares/aurora/98/files/latest/download";
              hash = "sha256-yBPRoIm2raovm5/JaPXYJGB5ua/woKGTDTPE8IaF8ZY=";
            };
            appimageContents = pkgs.appimageTools.extractType2 { inherit pname version src; };
          in
            pkgs.appimageTools.wrapType2 {
              inherit pname version src;
              
              extraPkgs = pkgs: [
                pkgs.icu
                pkgs.libinput
                pkgs.libevdev
              ];

              extraInstallCommands = ''
                install -Dm444 ${appimageContents}/aurora-electron.desktop -t $out/share/applications
                substituteInPlace $out/share/applications/aurora-electron.desktop \
                  --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
                mkdir $out/share/icons
                cp -r ${appimageContents}/usr/share/icons $out/share
              '';
            };
          waywall = pkgs.stdenv.mkDerivation {
            pname = "waywall";
            version = "0.0.0-ed76c2b605d19905617d9060536e980fd49410bf";

            src = pkgs.fetchFromGitHub {
              owner = "tesselslate";
              repo = "waywall";
              rev = "ed76c2b605d19905617d9060536e980fd49410bf";
              hash = "sha256-bLIoGLXnBrn46EVk0PkGePslKYL7V/h1mnI+s9GFSnY=";
            };

            patches = [
              ./nixos-configurations/common/patches/waywall/0001-meson-make-waywall-installable.patch
            ];

            nativeBuildInputs = [
              pkgs.meson
              pkgs.pkg-config
              pkgs.ninja
            ];

            buildInputs = [
              pkgs.wayland-protocols
              pkgs.wayland-scanner
              pkgs.luajit
              pkgs.wayland
              pkgs.libxkbcommon
              pkgs.libspng
              pkgs.libxcb
              pkgs.xwayland
              pkgs.libglvnd
            ];

            dontUseMesonConfigure = true;
            dontUseNinjaBuild = true;
            dontUseNinjaCheck = true;
            dontUseNinjaInstall = true;
          };
          glfw-minecraft-waywall = let
            minecraftPatches = pkgs.fetchFromGitHub {
              owner = "BoyOrigin";
              repo = "glfw-wayland";
              rev = "f62b4ae8f93149fd754cadecd51d8b1a07d20522";
              hash = "sha256-kvWP34rOD4HSTvnKb33nvVquTGZoqP8/l+8XQ0h3b7Y=";
            };
            minecraftPatchesWaywall = pkgs.fetchFromGitHub {
              owner = "tesselslate";
              repo = "waywall";
              rev = "ed76c2b605d19905617d9060536e980fd49410bf";
              hash = "sha256-bLIoGLXnBrn46EVk0PkGePslKYL7V/h1mnI+s9GFSnY=";
            };
          in
            pkgs.glfw.overrideAttrs {
              prePatch = ''
                patches+=(${minecraftPatches}/patches/{0002,0004}-*.patch)
                patches+=(${minecraftPatchesWaywall}/contrib/*.patch)
              '';
            };
          ninjabrain-bot = let
            javaOptions = [
              "-Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel"
              "-Dawt.useSystemAAFontSettings=on"
              "-Dswing.aatext=true"
            ];
          in
            pkgs.stdenv.mkDerivation rec {
              pname = "ninjabrainbot";
              version = "1.5.1";

              src = pkgs.fetchurl {
                url = "https://github.com/Ninjabrain1/Ninjabrain-Bot/releases/download/${version}/Ninjabrain-Bot-${version}.jar";
                hash = "sha256-Rxu9A2EiTr69fLBUImRv+RLC2LmosawIDyDPIaRcrdw=";
              };

              dontUnpack = true;

              nativeBuildInputs = [
                pkgs.makeWrapper
              ];

              installPhase = ''
                runHook preInstall

                install -Dm644 ${src} $out/share/java/${pname}-${version}.jar

                makeWrapper ${pkgs.jdk21}/bin/java $out/bin/${pname} \
                  --add-flags "-jar $out/share/java/${pname}-${version}.jar" \
                  --prefix _JAVA_OPTIONS : '${pkgs.lib.escapeShellArgs javaOptions}' \
                  --prefix LD_LIBRARY_PATH : ${
                  pkgs.lib.makeLibraryPath [
                    pkgs.libxkbcommon
                    pkgs.xorg.libX11
                    pkgs.xorg.libXt
                    pkgs.xorg.libXtst
                    pkgs.xorg.libXinerama
                    pkgs.xorg.libxcb
                  ]
                }

                runHook postInstall
              '';

              meta = {
                homepage = "https://github.com/Ninjabrain1/Ninjabrain-Bot";
                description = "Accurate stronghold calculator for Minecraft speedrunning.";
                platforms = pkgs.lib.platforms.linux;
              };
            };
          sarunint-live-cd = self'.nixosConfigurations.sarunint-live-cd.config.system.build.isoImage;
        };

        devShells = {
          rust = (import ./dev-shells/rust/rust.nix { inherit pkgs; });
          nodejs_18 = (import ./dev-shells/nodejs/18.nix { inherit pkgs; });
          nodejs_20 = (import ./dev-shells/nodejs/20.nix { inherit pkgs; });
          nodejs_22 = (import ./dev-shells/nodejs/22.nix { inherit pkgs; });
          vscode_java = (import ./dev-shells/vscode/java.nix { inherit pkgs; });
        };
      };
      flake = {
        nixosConfigurations = {
          sarunint-nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./nixos-configurations/sarunint-nixos/configuration.nix
            ];
          };

          sarunint-workstation-nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./nixos-configurations/sarunint-workstation-nixos/configuration.nix
            ];
          };

          sarunint-nixos-laptop = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./nixos-configurations/sarunint-nixos-laptop/configuration.nix
            ];
          };

          sarunint-live-cd = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./nixos-configurations/sarunint-live-cd/configuration.nix
            ];
          };
        };
      };
    });
}
