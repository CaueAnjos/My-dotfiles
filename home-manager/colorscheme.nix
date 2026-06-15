{
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (inputs) nix-colors;
  theme = import ../theme.nix;

  defaultCursorTheme = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 16;
  };

  themeConfig = {
    "gruvbox-dark-hard" = {
      gtk = {
        enable = true;
        colorScheme = "dark";
        cursorTheme = defaultCursorTheme;
        iconTheme = {
          name = "Gruvbox-Plus-Dark";
          package = pkgs.gruvbox-plus-icons;
        };
      };
    };
  };
  currentTheme = themeConfig.${theme};
in {
  imports = [
    nix-colors.homeManagerModules.default
  ];
  colorScheme = nix-colors.colorSchemes.${theme};
  inherit (currentTheme) gtk;

  qt.platformTheme.name = lib.mkForce "gtk3";

  home = {
    pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      inherit (currentTheme.gtk.cursorTheme) package name size;
    };
  };
}
