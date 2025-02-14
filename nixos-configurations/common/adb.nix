{ ... }:
{
  programs.adb.enable = true;
  users.users.sarunint.extraGroups = [ "adbusers" ];
}