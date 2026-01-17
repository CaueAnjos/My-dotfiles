{
  inputs,
  lib,
  pkgs,
  ...
}: let
  wallpapers = pkgs.stdenv.mkDerivation {
    name = "wallpapers";
    src = pkgs.fetchFromGitHub {
      owner = "atraxsrc";
      repo = "tokyonight-wallpapers";
      rev = "934ab9932f8074fe1f96a07cac5926c62760caf5";
      hash = "sha256-GAkJ7l8vwJsyIe2Wl7r8Bw0cZ4RiJ44vaaaLCtIbzQY=";
    };
    installPhase = ''
      mkdir $out
      cp * $out
    '';
    dontBuild = true;
  };
  pike-wallpaper = pkgs.writeShellScriptBin "pike-wallpaper" ''
    WALLPAPER=$(find "${wallpapers}" -type f | shuf -n 1)
    swww img "$WALLPAPER" \
    --transition-type grow \
    --transition-duration 1
  '';
in {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    {
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
              "Super-Space".launch = [(lib.getExe pkgs.fuzzel)];
              "Alt-l".launch = [(lib.getExe pkgs.hyprlock)];
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
  ];
}
