{ inputs, ... }:

{
  environment.etc.glfw-minecraft-waywall.source = inputs.self.packages.x86_64-linux.glfw-minecraft-waywall;
}