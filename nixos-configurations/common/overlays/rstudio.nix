{ ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      rstudio = super.rstudio.override {
        nodejs = super.nodejs_22;
      };
    })
  ];
}