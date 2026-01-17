{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    package = inputs.hyperland.packages.${pkgs.system}.hyprland;
    enable = true;
    settings = {
      "$mod" = "SUPER";
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 4;
          new_optimizations = "on";
          ignore_opacity = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
          color = "0x66000000";
        };
      };
      bind =
        [
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"

          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, j, movewindow, d"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, l, movewindow, r"

          "$mod, d, killactive"

          "$mod, SPACE, exec, hyprlauncher"
        ]
        ++ (builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9));
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  services = {
    dunst.enable = true;
  };
  services.hyprlauncher = {
    enable = true;
    settings = {
      cache = {
        enabled = true;
      };
      finders = {
        desktop_icons = true;
        math_prefix = "=";
      };
      general = {
        grab_focus = true;
      };
      ui = {
        window_size = "400 260";
      };
    };
  };
}
