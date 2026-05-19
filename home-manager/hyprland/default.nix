{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    package = inputs.hyperland.packages.${pkgs.system}.hyprland;
    enable = true;
    settings = {
      exec-once = [
        "noctalia-shell"
      ];

      input = {
        kb_layout = "us,br";
        kb_options = "grp:alt_shift_toggle";
      };
      general = {
        gaps_in = 4;
        gaps_out = 4;
        monitor = [
          "DP-2, 1920x1080@144, -1920x0, 1"
          "DP-1, 1920x1080@300, 0x0, 1"
        ];
      };

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

          "$mod ALT, h, resizeactive, -15% 0%"
          "$mod ALT, j, resizeactive, 0% 15%"
          "$mod ALT, k, resizeactive, 0% -15%"
          "$mod ALT, l, resizeactive, 15% 0%"

          "$mod, d, killactive"
          "$mod, f, fullscreen"
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
}
