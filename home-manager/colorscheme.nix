{
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (inputs) nix-colors;
  theme = "gruvbox-dark-hard";

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
        theme = {
          name = "Gruvbox-Dark-Compact-Soft";
          package = pkgs.gruvbox-gtk-theme.override {
            colorVariants = ["dark"];
            sizeVariants = ["compact"];
            themeVariants = ["default"];
            tweakVariants = ["macos" "soft"];
            iconVariants = [];
          };
        };
        iconTheme = {
          name = "Gruvbox-Plus-Dark";
          package = pkgs.gruvbox-plus-icons;
        };
        font = {
          name = "Jetbrains Mono";
          package = pkgs.nerd-fonts.jetbrains-mono;
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

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home = {
    pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      inherit (currentTheme.gtk.cursorTheme) package name size;
    };
    language.base = "en";
  };
}
