{
  pkgs ? import <nixpkgs> { },
}:
let
  overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
in
pkgs.callPackage (
  {
    stdenv,
    mkShell,
    rustup,
    rustPlatform,
  }:
  mkShell rec {
    strictDeps = true;
    nativeBuildInputs = [
      rustup
      rustPlatform.bindgenHook
    ];
    # libraries here
    buildInputs =
      [
        pkgs.wayland
        pkgs.pkg-config
        pkgs.libxkbcommon
        pkgs.vulkan-loader
      ];
    RUSTC_VERSION = overrides.toolchain.channel;
    # https://github.com/rust-lang/rust-bindgen#environment-variables
    shellHook = ''
      export PATH="''${CARGO_HOME:-~/.cargo}/bin":"$PATH"
      export PATH="''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-${stdenv.hostPlatform.rust.rustcTarget}/bin":"$PATH"
      export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${builtins.toString (pkgs.lib.makeLibraryPath buildInputs)}";
    '';
  }
) { }
