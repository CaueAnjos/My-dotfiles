{
  pkgs,
  config,
  ...
}: let
  inherit (config.colorScheme) palette;
in {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-lgc-plus
  ];

  fonts.fontconfig.enable = true;

  programs.ghostty = {
    enable = true;
    settings = {
      background = "${palette.base00}";
      foreground = "${palette.base05}";
      cursor-color = "${palette.base05}";
      selection-foreground = "${palette.base00}";
      selection-background = "${palette.base05}";
      palette = [
        "0=${palette.base00}"
        "1=${palette.base08}"
        "2=${palette.base0B}"
        "3=${palette.base0A}"
        "4=${palette.base0D}"
        "5=${palette.base0E}"
        "6=${palette.base0C}"
        "7=${palette.base05}"
        "8=${palette.base03}"
        "9=${palette.base08}"
        "10=${palette.base0B}"
        "11=${palette.base0A}"
        "12=${palette.base0D}"
        "13=${palette.base0E}"
        "14=${palette.base0C}"
        "15=${palette.base07}"
      ];

      font-family = [
        "JetBrainsMono Nerd Font"
        "Noto Sans Symbols 2"
      ];
      font-size = 13;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      background-opacity = 0.7;
      quit-after-last-window-closed = false;
    };
  };
}
