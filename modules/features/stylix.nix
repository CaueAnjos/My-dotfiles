{inputs, ...}: let
  # Theme for the whole system
  theme = "gruvbox-dark-hard";
in {
  flake.modules.nixos.ThemedStylix = {
    pkgs,
    config,
    lib,
    ...
  }: let
    wallpapers = inputs.gruvbox-walls.packages.${pkgs.stdenv.hostPlatform.system}.default;
    image = "${wallpapers}/momo_ayase_gruvbox.png";
  in {
    imports = with inputs; [
      stylix.nixosModules.stylix
      qylock.nixosModules.default
    ];

    boot.loader.limine.style = {
      interface.resolution = "1920x1080";
      graphicalTerminal.background = lib.mkForce "80${config.lib.stylix.colors.base00}";
    };

    programs.qylock = {
      enable = true;
      theme = "women-umbrella";
      sddm.enable = true;
      quickshell.enable = false;
    };

    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
      polarity = "dark";
      opacity.terminal = 0.7;
      inherit image;

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

  flake.modules.homeManager.ThemedStylix = {pkgs, ...}: let
    wallpapers = inputs.gruvbox-walls.packages.${pkgs.stdenv.hostPlatform.system}.default;
  in {
    home.file."wallpapers".source = wallpapers;
  };
}
