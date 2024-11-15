{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    dunst
    hyprpolkitagent
    waybar
    wofi
  ];
}