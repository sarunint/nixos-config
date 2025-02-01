{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    filelight
    kcalc
    ksystemlog
    isoimagewriter
    # kamoso
    ktimer
    konversation
    kclock
    kasts
  ];
}