{ inputs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile."hypr/.luarc.json".enable = false;
  xdg.configFile."hypr/hyprland.lua".enable = false;

  programs.caelestia = {
    enable = true;
    cli.enable = true;
  };
}

