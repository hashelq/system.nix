{ config, pkgs, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1p1";
  boot.kernelParams = [ "module_blacklist=i915" ];
  
}
