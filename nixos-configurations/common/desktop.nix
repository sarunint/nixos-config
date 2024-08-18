{ ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.diaplayManager.sddm.wayland.compositor = "kwin";
  services.desktopManager.plasma6.enable = true;
}