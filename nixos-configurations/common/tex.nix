{ pkgs, ... }: {
  environment.systemPackages =
    let
      tex = pkgs.texliveBasic.withPackages (
        ps: []
      );
    in
      [
        tex
      ];
}