{ ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      nix-output-monitor = super.nix-output-monitor.overrideAttrs (final: prev: {
        version = "2.1.8-9a32f32f807a4f7bc97d95606465243f293650fe";
        src = self.fetchzip {
          url = "https://code.maralorn.de/maralorn/nix-output-monitor/archive/9a32f32f807a4f7bc97d95606465243f293650fe.zip";
          hash = "sha256-04ME0a3MUH/Y306dFWgOOCghzwcadTDpqJFkhLonIrw=";
        };
      });
    })
  ]
  ;
}