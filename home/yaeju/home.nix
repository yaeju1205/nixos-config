{ pkgs, lib, ... }:

{
  imports = 
    [
      ./modules/packages.nix

      ./modules/cli/direnv.nix
      ./modules/cli/claude-code.nix
      ./modules/cli/packages.nix

      ./modules/desktop/file-manager.nix
      ./modules/desktop/hyprland.nix
      ./modules/desktop/obs.nix
      ./modules/desktop/packages.nix

      ./modules/theme/font.nix
      ./modules/theme/gtk-theme.nix

      ./modules/system/clipboard.nix
    ];

  home.username = "yaeju";
  home.homeDirectory = "/home/yaeju";
  home.stateVersion = "26.05";
  home.pointerCursor = {
    enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  xdg.configFile =
    builtins.mapAttrs
      (name: _: {
        source = ./dotfiles + "/${name}";
      })
      (lib.filterAttrs
        (_: type: type == "directory")
        (builtins.readDir ./dotfiles));
}

