{ config, pkgs, ...}:

{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  #programs.steam = {
  #  enable = true;
  #  remotePlay.openFirewall = true;
  #  dedicatedServer.openFirewall = true;
  #};
  programs.fuse.userAllowOther = true;

  programs.firejail.enable = true;
}
