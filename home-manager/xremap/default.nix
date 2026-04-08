{
  inputs,
  lib,
  pkgs,
  ...
}: let
  wallpapers = inputs.gruvbox-walls.packages.${pkgs.system}.default;

  pike-wallpaper = pkgs.writeShellScriptBin "pike-wallpaper" ''
    # display only filenames in walker (grid layout handled in walker config)
    NAME=$(find "$HOME/wallpapers" -printf "%f\n" | sort -u | walker --dmenu)
    [ -z "$NAME" ] && exit 0

    # resolve selected filename back to full path
    WALL=$(find "$HOME/wallpapers" -name "$NAME" | head -n1)
    [ -z "$WALL" ] && exit 0

    awww img "$WALL" \
      --transition-type any \
      --transition-duration 1
  '';
in {
  home.file."wallpapers" = {
    source = wallpapers;
    recursive = true;
  };

  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    enable = true;
    withGnome = true;
    config.modmap = [
      {
        name = "Global";
        remap = {
          "CapsLock" = {
            held = "Ctrl_R";
            alone = "Esc";
          };
        };
      }
    ];

    config.keymap = [
      {
        name = "Launch";
        remap = {
          "Super-T".launch = [(lib.getExe pkgs.ghostty) "+new-window"];
          "Super-B".launch = [(lib.getExe pkgs.firefox)];
          "Super-Space".launch = [(lib.getExe pkgs.walker)];
          "Alt-P".launch = [(lib.getExe pike-wallpaper)];
        };
      }
      {
        name = "Global";
        remap = {
          "Ctrl-M" = "Enter";
          Ctrl-Shift-h = "Left";
          Ctrl-Shift-j = "Down";
          Ctrl-Shift-k = "Up";
          Ctrl-Shift-l = "Right";
        };
      }
    ];
  };
}
