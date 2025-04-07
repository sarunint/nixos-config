{ pkgs, ... }:
{
  appstream.enable = true;
  environment.systemPackages = [ pkgs.appstream pkgs.appstream-glib ];
}