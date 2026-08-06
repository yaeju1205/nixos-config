{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    vim
    neovim

    zip
    unzip

    fzf
    fd
    ripgrep

    btop
  ];
}
