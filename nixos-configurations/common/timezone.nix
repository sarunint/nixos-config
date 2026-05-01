{ lib, ... }:

{
  # Set your time zone.
  time.timeZone = lib.mkForce null;
  services.automatic-timezoned.enable = true;
}