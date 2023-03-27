{ config, pkgs, ... }:

{
  networking.nameservers = [ "1.1.1.1" ];
  networking.resolvconf.dnsExtensionMechanism = false;

  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.resolvconf.enable = pkgs.lib.mkForce false;
  networking.dhcpcd.extraConfig = "nohook resolv.conf";
}
