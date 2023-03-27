{ config, pkgs, ... }:

{
  imports =
    [
      ./platform.nix
      ./hardware.nix
      ./programs.nix
      ./certs.nix
      ./nix.nix
      ./boot.nix
      ./networking.nix
      ./services.nix
      ./packages.nix
      ./users.nix
    ];

  # github.com/hashelq/dosu instead
  security.sudo.enable = false;
  nix.settings.trusted-users = ["root" "neko"];
  virtualisation.libvirtd.enable = true;
  virtualisation.lxd.enable = true;  

  systemd.services.sudo_dosu = {
    serviceConfig.Type = "simple";
    serviceConfig.ExecStart = "${pkgs.coreutils}/bin/ln -s /run/wrappers/bin/dosu /usr/bin/sudo";
  };

  time.timeZone = "Asia/Vladivostok"; 

  # DOSU wrapper
  security.wrappers.dosu = {
    setuid = true;
    owner = "root";
    group = "root";
    source = "${pkgs.dosu}/bin/dosu";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}

