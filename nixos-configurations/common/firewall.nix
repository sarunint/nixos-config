{ ... }:

{
  networking.firewall.enable = true;
  # networking.nftables.enable = true;
  networking.firewall = {
    allowedTCPPorts = [ 4455 ];
  };
}