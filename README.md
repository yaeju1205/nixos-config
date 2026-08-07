# nixos-config

Flake-based [Home Manager](https://github.com/nix-community/home-manager) configuration for `x86_64-linux` (user `yaeju`).

## Overview

This repository manages my user environment with standalone Home Manager:

- **Nixpkgs**: `nixos-unstable`
- **Home Manager**: latest master (nixpkgs follows)
- **Modules**: organized by category under `home/yaeju/modules/`
- **Dotfiles**: raw config files linked into `~/.config` via `xdg.configFile`

## Layout

```
.
├── flake.nix                        # inputs + homeConfigurations.yaeju + dev shell
├── home.nix                         # imports home/yaeju/home.nix
└── home/yaeju/
    ├── home.nix                     # entry point: user settings, module imports, dotfile links
    ├── dotfiles/
    │   ├── kitty/                   # kitty.conf + blossom theme
    │   ├── vim/                     # vimrc (+ nix ftplugin)
    │   └── wireplumber/             # vesktop audio permission rules
    └── modules/
        ├── packages.nix             # global nixpkgs config (allowUnfree)
        ├── cli/
        │   ├── direnv.nix           # direnv + nix-direnv
        │   ├── claude-code.nix      # Claude Code (nix-claude-code flake)
        │   └── packages.nix         # git, vim, neovim, zip/unzip, fzf, fd, ripgrep, btop
        ├── desktop/
        │   ├── file-manager.nix     # Nemo + xdg.mimeApps defaults
        │   ├── hyprland.nix         # Hyprland via Caelestia Shell module
        │   ├── obs.nix              # OBS Studio + plugins (wlrobs, background removal, pipewire)
        │   └── packages.nix         # grim, slurp, pavucontrol, kitty, firefox, vesktop, nextcloud-client
        ├── system/
        │   └── clipboard.nix        # wl-clipboard + cliphist
        └── theme/
            ├── font.nix             # fontconfig + JetBrainsMono Nerd Font
            └── gtk-theme.nix        # Adwaita-dark GTK theme + dconf color-scheme
```

## Features

- **Hyprland** — managed through the [Caelestia Shell](https://github.com/caelestia-dots/shell) home-manager module, with keybinds/settings pulled from [`hypr-config`](https://github.com/yaeju1205/hypr-config)
- **Neovim** — configuration from the separate [`nvim-config`](https://github.com/yaeju1205/nvim-config) repository
- **OBS Studio** — declarative plugins: `wlrobs` (Wayland capture), background removal, PipeWire audio capture
- **File manager** — Nemo with file-roller integration, registered as the default via `xdg.mimeApps`
- **Clipboard** — `wl-clipboard` + `cliphist`
- **Shell tooling** — direnv/nix-direnv, Claude Code, fzf/fd/ripgrep
- **Theme** — dark GTK (`Adwaita-dark`) with matching dconf setting, JetBrainsMono Nerd Font

## Requirements

- Nix with **flakes** enabled
- [Home Manager](https://nix-community.github.io/home-manager/) (standalone)

## Usage

```bash
# enter the dev shell (nixd + home-manager)
nix develop

# build & switch
home-manager switch --flake .#yaeju

# dry-run build without applying
home-manager build --flake .#yaeju
```

The repo ships with an `.envrc` (`use flake`) for direnv users.

## Related

- [nvim-config](https://github.com/yaeju1205/nvim-config) — Neovim configuration
- [hypr-config](https://github.com/yaeju1205/hypr-config) — Hyprland configuration
- [caelestia-dots/shell](https://github.com/caelestia-dots/shell) — Wayland shell used with Hyprland
