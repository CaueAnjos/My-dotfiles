{
  inputs,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    package = inputs.hyperland.packages.${pkgs.system}.hyprland;
    enable = true;
    settings = {
      exec-once = [
        "${lib.getExe pkgs.waybar}"
      ];

      input = {
        kb_layout = "us,br";
        kb_options = "grp:alt_shift_toggle";
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
    swww.enable = true;
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = let
          blackscreen = pkgs.writeShellApplication {
            name = "blackscreen";
            runtimeInputs = with pkgs; [
              bc
              ddcutil
            ];
            text = ''
              TARGET=0
              DURATION=2

              current=$(ddcutil getvcp 10 | grep -oP "([0-9]+)(?=,)")
              STEPS=1
              STAGES=$(echo "scale=2; ($current - $TARGET) / $STEPS" | bc)
              DELAY=$(echo "scale=2; $DURATION / $STAGES" | bc)
              echo "$DELAY"

              # shellcheck disable=SC2086
              while [ $current -gt $TARGET ]; do
                  ((current = current - STEPS))
                  ddcutil setvcp 10 $current -b 4 --sleep-multiplier .1
                  sleep "$DELAY"
              done
            '';
          };
        in [
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
          {
            timeout = 150;
            on-timeout = "${lib.getExe blackscreen}";
            on-resume = "pkill blackscreen | ${lib.getExe pkgs.ddcutil} setvcp 10 60 -b 4 --sleep-multiplier .1";
          }
          {
            timeout = 160;
            on-timeout = "loginctl lock-session";
          }
        ];
      };
    };
  };
}
