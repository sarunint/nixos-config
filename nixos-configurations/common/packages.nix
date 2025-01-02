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
    xwaylandvideobridge
    vlc
    gimp
    hw-probe
    kdePackages.krdc
    jdk8
    jdk17
    jdk21
    kdePackages.partitionmanager
  ];
}
