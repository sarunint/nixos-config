{ pkgs, ... }: {
  environment.systemPackages =
    let
      tex = pkgs.texliveFull;
    in
      [
        tex
      ];
}