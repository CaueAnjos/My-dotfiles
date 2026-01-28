{inputs, ...}: let
  inherit (inputs) nix-colors;

  # NOTE: this name should be at [base16](https://github.com/tinted-theming/base16-schemes)
  theme = "catppuccin-mocha";
in {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.${theme};
}
