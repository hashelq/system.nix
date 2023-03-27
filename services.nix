{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    #socketActivation = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  
  systemd.services.systemd-fsck.enable = false;
  systemd.services.display-manager.enable = false;
  systemd.services.polkit.enable = false;
  systemd.services.cron.enable = false;
  systemd.services.firewall.enable = false;
  systemd.services.systemd-timesyncd.enable = false;
  systemd.services.libvirt-guests.enable = false;
  systemd.services.libvirtd.enable = false;
  systemd.services.lxd.enable = false;
  systemd.services.acpid.enable = false;

  # Configure keymap in X11
  services.xserver.layout = "us";
  
}
