{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.walker.homeManagerModules.default];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "nix-collors";
      placeholders.default = {
        input = "Search";
        list = "No Results";
      };
      providers.prefixes = [
        {
          provider = "websearch";
          prefix = "@";
        }
        {
          provider = "providerlist";
          prefix = "_";
        }
      ];
      keybinds.quick_activate = ["F1" "F2" "F3"];
    };

    # Custom theme
    themes = {
      "nix-collors" = {
        style = import ./theme.nix config.colorScheme.palette;
      };
    };
  };
}
