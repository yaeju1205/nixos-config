{ inputs, system, ... }: {
  home.packages = [
    inputs.nix-claude-code.packages.${system}.default
  ];
}
