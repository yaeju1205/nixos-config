{
  description = "Yaeju's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-claude-code = {
      url = "github:ryoppippi/nix-claude-code";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-config = {
      url = "github:yaeju1205/nvim-config";
      flake = false;
    };

    hypr-config = {
      url = "github:yaeju1205/hypr-config";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, caelestia-shell, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        nixd
      ];
      packages = [
        inputs.home-manager.packages.${system}.home-manager
      ];
    };
    homeConfigurations.yaeju =
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit system;
          inherit inputs;
        };

        modules = [
          ./home.nix
        ];
      };
  };
}
