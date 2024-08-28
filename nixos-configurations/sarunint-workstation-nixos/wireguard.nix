{ ... }:

{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.31.41.7/32" "fd08:1260:6fd1::7/128"];
      dns = [ "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001"];
      privateKeyFile = "/home/sarunint-nixos/wireguard-keys/private";

      peers = [
        {
          publicKey = "gIJ3ZvpSUwKiKOOCRESLbdfchSEBIaDK63Eyq0FcZFU=";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "139.162.18.218:23052";
          persistentKeepalive = 25;
        }
      ];

      autostart = false;
    };
  };
}