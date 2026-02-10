{
  inputs,
  lib,
  pkgs,
  ...
}: let
  pike-wallpaper = pkgs.writeShellScriptBin "pike-wallpaper" ''
    WALLPAPER=$(find "${inputs.gruvbox-walls.packages.${pkgs.system}.default}" -type f | shuf -n 1)
    swww img "$WALLPAPER" \
    --transition-type grow \
    --transition-duration 1
  '';
in {
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
