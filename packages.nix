{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      dosu = pkgs.callPackage (pkgs.fetchFromGitHub {
        owner = "hashelq";
        repo = "dosu";
        rev = "7c468e423681eda0d03a7063e9457159ebaafc2a";
        sha256 = "+TpztVUlrMReeEHKBLLZn4D8ulC4/hrms1aGT0F0kP4=";
      }) { };
    })
  ];
  environment.systemPackages = with pkgs; [
    bindfs
    openssl
    pkg-config
    ladspaPlugins
    dosu
    python
    mitmproxy
    #neovim
    openssl_3_0
    firejail
    (wine.override { wineBuild = "wine32"; })
  ];
}
