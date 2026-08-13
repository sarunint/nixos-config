{ pkgs, ... }:

let 
  rPackages = with pkgs.rPackages; [
    swirl
  ];
  R-with-my-packages = pkgs.rWrapper.override {
    packages = rPackages;
  };
  RStudio-with-my-packages = pkgs.rstudioWrapper.override {
    packages = rPackages;
  };
in 
{
  environment.systemPackages = [
    R-with-my-packages
    RStudio-with-my-packages
  ];
}
