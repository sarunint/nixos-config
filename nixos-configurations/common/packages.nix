{ pkgs, inputs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    maliit-keyboard
    efibootmgr
    file
    git
    nixd
    nixfmt-rfc-style
    vscode-fhs
    prismlauncher
    inputs.self.packages.x86_64-linux.ferium
    pass-wayland
    qtpass
    qpwgraph
    vlc
    gimp
    hw-probe
    kdePackages.krdc
    jdk8
    jdk17
    jdk21
    kdePackages.partitionmanager
    scrcpy
    inputs.self.packages.x86_64-linux.musescore-appimage
    muse-sounds-manager
    libreoffice-qt6-fresh
    localsend
    rquickshare
    kubernetes-helm
    corefonts
    vista-fonts
    google-chrome
    musescore
    winboat
    inputs.self.packages.x86_64-linux.waywall
    inputs.self.packages.x86_64-linux.ninjabrain-bot
    nix-output-monitor
    android-tools
    zotero
  ];
}
