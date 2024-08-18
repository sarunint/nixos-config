{ pkgs, ... }:

{
  users.users.sarunint = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      neovim
    ];
    hashedPassword = "$y$j9T$.Ka5PC/vpIztuiOBG43rR.$7F3Q5ZLfgO1iYZ6Z7NBGPedLcZxLYTjXd95LvUNUkv/";
  };
}