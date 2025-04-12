{ ... }:
{
  services.blockgame-meta = {
    enable = true;
    settings = {
      DEPLOY_TO_FOLDER = "true";
      DEPLOY_FOLDER_USER = "sarunint";
      DEPLOY_FOLDER_GROUP = "users";
      DEPLOY_FOLDER = "/home/sarunint-nixos/dev/prism-meta";
      META_UPSTREAM_URL="https://github.com/PrismLauncher/meta-upstream";
      META_LAUNCHER_URL="https://github.com/PrismLauncher/meta-launcher";
    };
  };
}