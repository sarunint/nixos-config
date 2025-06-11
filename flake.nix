{
  description = "SarunInt's flake for NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    prism-meta = {
      url = "github:PrismLauncher/meta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
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

    packages.x86_64-linux = { 
      ferium = pkgs.ferium.overrideAttrs {
        patches = [
          ./nixos-configurations/common/patches/ferium.patch
        ];
      };
      musescore-appimage = let 
        pname = "musescore-appimage";
        version = "4.5.2";
        src = pkgs.fetchurl {
          url = "https://cdn.jsdelivr.net/musescore/v${version}/MuseScore-Studio-${version}.251141401-x86_64.AppImage";
          hash = "sha256-0BC2Rkx4tNojB3608Jb5Sa5ousTICaiwCKDPv0jiYKU=";
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
    };

    devShells.x86_64-linux.rust = (import ./dev-shells/rust/rust.nix { inherit pkgs; });
    devShells.x86_64-linux.nodejs_18 = (import ./dev-shells/nodejs/18.nix { inherit pkgs; });
    devShells.x86_64-linux.nodejs_20 = (import ./dev-shells/nodejs/20.nix { inherit pkgs; });
    devShells.x86_64-linux.nodejs_22 = (import ./dev-shells/nodejs/22.nix { inherit pkgs; });
    devShells.x86_64-linux.vscode_java = (import ./dev-shells/vscode/java.nix { inherit pkgs; });

    packages.x86_64-linux.sarunint-live-cd = self.nixosConfigurations.sarunint-live-cd.config.system.build.isoImage;
  };
}
