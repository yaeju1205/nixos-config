{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nemo
    nemo-fileroller
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "nemo.desktop";
      "application/x-gnome-saved-search" = "nemo.desktop";
    };
  };
}
