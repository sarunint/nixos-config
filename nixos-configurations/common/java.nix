{ pkgs, ... }:

{
  environment.etc = {
    jdk25.source = pkgs.jdk25;
    jdk21.source = pkgs.jdk21;
    jdk17.source = pkgs.jdk17;
    jdk8.source = pkgs.jdk8;
  };
}