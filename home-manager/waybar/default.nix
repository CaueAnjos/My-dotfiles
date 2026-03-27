{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (config.colorScheme) palette;
  hexToRgba = hex: alpha: let
    h =
      if builtins.substring 0 1 hex == "#"
      then builtins.substring 1 (builtins.stringLength hex - 1) hex
      else hex;

    toInt = c: (builtins.fromTOML "value=0x${c}").value;

    r = toInt (builtins.substring 0 2 h);
    g = toInt (builtins.substring 2 2 h);
    b = toInt (builtins.substring 4 2 h);
  in "rgba(${toString r}, ${toString g}, ${toString b}, ${toString alpha})";
in {
  programs = {
    waybar = {
      enable = true;
      style = import ./waybar.nix palette;
      settings = [
        {
          modules-left = ["custom/nixos" "hyprland/workspaces" "hyprland/window"];
          modules-center = ["clock" "custom/inhibitor"];
          modules-right = ["hyprland/language" "network" "pulseaudio" "custom/power"];
          "custom/nixos" = {
            format = "󱄅";
            tooltip = false;
          };
          "network" = {
            family = "ipv4_6";
            format-ethernet = "";
            format-wifi = "󰖩";
            format-disconected = "󰖪";
          };
          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = " ";
            tooltip = false;
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            format-icons = ["" " " " "];
          };
          "custom/inhibitor" = let
            toggleInhibitor = pkgs.writeShellApplication {
              name = "toggleInhibitor";
              runtimeInputs = [
                pkgs.notify-desktop
              ];
              text = ''
                set +u
                STATE_FILE="/tmp/waybar_toggle_inhibitor"

                if [[ "$1" == "toggle" ]]; then
                    if [[ -f "$STATE_FILE" ]]; then
                        systemctl --user stop hypridle.service
                        rm "$STATE_FILE"
                        notify-desktop "inhibitor ON" "Screen wont sleep until you turn it off" -a "system" -u low -t 3000 -r 9991
                    else
                        systemctl --user start hypridle.service
                        touch "$STATE_FILE"
                        notify-desktop "inhibitor OF" "Screen can sleep in peace again!" -a "system" -u low -t 3000 -r 9991
                    fi
                fi

                if [[ -f "$STATE_FILE" ]]; then
                    echo '{"text":"󰍹","class":"off"}'
                else
                    echo '{"text":"󰷛","class":"on"}'
                fi
              '';
            };
          in {
            exec = lib.getExe toggleInhibitor;
            on-click = "${lib.getExe toggleInhibitor} toggle";
            interval = 1;
            return-type = "json";
          };
          "clock" = {
            interval = 1;
            tooltip = false;
            format = "{:%H:%M}";
            format-alt = "{:%A, %d %B %Y — %H:%M:%S}";
            on-click = "toggle";
          };
          "hyprland/window" = {
            format = "{}";
            max-length = 50;
            separate-outputs = true;
            rewrite = {
              "(.*) — Mozilla Firefox" = "󰈹  $1";
              "nvim(.*)" = " $1";
              "tmux a(.*)" = " $1";
            };
          };
          "hyprland/language" = {
            format = "󰌌 {short}";
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "custom/power" = {
            format = "⏻";
            on-click = lib.getExe pkgs.wlogout;
          };
        }
      ];
    };

    wlogout = {
      enable = true;
      style = import ./wlogout-theme.nix;
      layout = [
        {
          label = "logout";
          text = "Logout";
          action = "hyprctl dispatch exit";
        }
        {
          label = "lock";
          text = "Lock";
          action = "loginctl lock-session";
        }
        {
          label = "sleep";
          text = "Sleep";
          action = "systemctl suspend";
        }
        {
          label = "hibernate";
          text = "Hibernate";
          action = "systemctl hibernate";
        }
        {
          label = "shutdown";
          text = "Shutdown";
          action = "systemctl -i poweroff";
        }
        {
          label = "reboot";
          text = "Reboot";
          action = "systemctl reboot";
        }
      ];
    };

    hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
          ignore_empty_input = true;
        };

        background = {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.7;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        };

        # Password input field
        input-field = {
          size = "300, 60";
          outline_thickness = 3;
          dots_size = 0.25;
          dots_spacing = 0.3;
          dots_center = true;
          outer_color = hexToRgba palette.base0E 1.0;
          inner_color = hexToRgba palette.base00 1.0;
          font_color = hexToRgba palette.base02 1.0;
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##${palette.base04}">Enter Password...</span>'';
          hide_input = false;
          rounding = 12;
          check_color = hexToRgba palette.base0B 1.0;
          fail_color = hexToRgba palette.base08 1.0;
          fail_text = ''<span foreground="##${palette.base08}">Wrong Password</span>'';
          capslock_color = "rgba(224, 175, 104, 1.0)";
          position = "0, -150";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = hexToRgba palette.base00 0.4;
        };

        label = [
          {
            text = ''cmd[update:1000] echo "$(date +"%H:%M")"'';
            color = hexToRgba palette.base0C 1.0;
            font_size = 120;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, 300";
            halign = "center";
            valign = "center";
            shadow_passes = 2;
            shadow_size = 5;
            shadow_color = hexToRgba palette.base00 0.4;
          }
          {
            text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
            color = hexToRgba palette.base0D 1.0;
            font_size = 24;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, 180";
            halign = "center";
            valign = "center";
          }
          {
            text = "Locked";
            color = hexToRgba palette.base0D 0.6;
            font_size = 16;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, -230";
            halign = "center";
            valign = "center";
          }
          {
            text = "Hi, $USER";
            color = hexToRgba palette.base0E 1.0;
            font_size = 28;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, -80";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
