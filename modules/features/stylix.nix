{inputs, ...}: let
  # Theme for the whole system
  theme = "gruvbox-dark-hard";
in {
  flake.modules.nixos.ThemedStylix = {pkgs, ...}: {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];

    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
      polarity = "dark";
      opacity.terminal = 0.7;

      cursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 16;
      };

      fonts = {
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

      icons = {
        enable = true;
        package = pkgs.gruvbox-plus-icons;
        dark = "Gruvbox-Plus-Dark";
        light = "Gruvbox-Plus-Light";
      };
    };
  };

  flake.modules.homeManager.ThemedStylix = {};
}
