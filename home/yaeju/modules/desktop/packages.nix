{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    grim
    slurp

    pavucontrol

    kitty

    firefox
    vesktop
    nextcloud-client
  ];
}
