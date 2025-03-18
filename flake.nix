{
  description = "SarunInt's flake for NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
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

      sarunint-live-cd = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos-configurations/sarunint-live-cd/configuration.nix
        ];
      };
    };

    packages.x86_64-linux.ferium = pkgs.ferium.overrideAttrs {
      patches = [
        ./nixos-configurations/common/patches/ferium.patch
      ];
    };

    devShells.x86_64-linux.rust = (import ./dev-shells/rust/rust.nix { inherit pkgs; });
    devShells.x86_64-linux.nodejs_18 = (import ./dev-shells/nodejs/18.nix { inherit pkgs; });
    devShells.x86_64-linux.nodejs_20 = (import ./dev-shells/nodejs/20.nix { inherit pkgs; });
    devShells.x86_64-linux.nodejs_22 = (import ./dev-shells/nodejs/22.nix { inherit pkgs; });
    devShells.x86_64-linux.vscode_java = (import ./dev-shells/vscode/java.nix { inherit pkgs; });

    packages.x86_64-linux.sarunint-live-cd = self.nixosConfigurations.sarunint-live-cd.config.system.build.isoImage;
  };
}
