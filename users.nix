{ config, pkgs, ... }:

{

  users.users = {
    neko = {
      isNormalUser = true;
      shell = pkgs.zsh;
      initialPassword = "r";
      extraGroups = [ "wheel" "dosb" "libvirtd" "lxd" ]; 
      packages = with pkgs; [
        librewolf
        wine
        wine
        winetricks
      ];
    };
    
    cape = {
      isNormalUser = true;
      initialPassword = "r";
      extraGroups = [ "libvirtd" ]; 
      packages = with pkgs; [ python3 ];
    };

    mitmproxyuser = {
      isNormalUser = true;
      initialPassword = "r";
      extraGroups = [ "wheel" ]; 
      packages = with pkgs; [
      python
      ];
    };
  };
}
