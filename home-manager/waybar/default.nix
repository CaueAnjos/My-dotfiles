{
  lib,
  config,
  pkgs,
  ...
}: {
  programs = {
    waybar = {
      enable = true;
      style = import ./waybar.nix config.colorScheme.palette;
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
            interval = 5;
            format = "{icon}";
            format-ethernet = "   {bandwidthUpBits}  {bandwidthDownBits}";
            format-wifi = "󰖩   {bandwidthUpBits}  {bandwidthDownBits}";
            format-disconected = "󰖪 ";
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
                        notify-desktop "inhibitor actived" -u low -t 1500
                    else
                        systemctl --user start hypridle.service
                        touch "$STATE_FILE"
                        notify-desktop "inhibitor deactivated" -u low -t 1500
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
          disable_loading_bar = true;
          hide_cursor = true;
          grace = 0;
          no_fade_in = false;
          no_fade_out = false;
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

        # User avatar circle with glow effect
        image = {
          path = "${./icons/hibernating.png}";
          size = 150;
          rounding = -1;
          border_size = 4;
          border_color = "rgba(187, 154, 247, 1.0)";
          position = "0, 50";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 8;
          shadow_color = "rgba(187, 154, 247, 0.5)";
        };

        # Password input field
        input-field = {
          size = "300, 60";
          outline_thickness = 3;
          dots_size = 0.25;
          dots_spacing = 0.3;
          dots_center = true;
          outer_color = "rgba(122, 162, 247, 0.3)";
          inner_color = "rgba(26, 27, 38, 0.9)";
          font_color = "rgba(192, 202, 245, 1.0)";
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##7aa2f7">Enter Password...</span>'';
          hide_input = false;
          rounding = 12;
          check_color = "rgba(158, 206, 106, 1.0)";
          fail_color = "rgba(247, 118, 142, 1.0)";
          fail_text = ''<span foreground="##f7768e">$FAIL ($ATTEMPTS)</span>'';
          capslock_color = "rgba(224, 175, 104, 1.0)";
          position = "0, -150";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(0, 0, 0, 0.4)";
        };

        label = [
          {
            text = ''cmd[update:1000] echo "$(date +"%H:%M")"'';
            color = "rgba(122, 162, 247, 1.0)";
            font_size = 120;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, 300";
            halign = "center";
            valign = "center";
            shadow_passes = 2;
            shadow_size = 5;
            shadow_color = "rgba(0, 0, 0, 0.5)";
          }
          {
            text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
            color = "rgba(125, 207, 255, 0.8)";
            font_size = 24;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, 180";
            halign = "center";
            valign = "center";
          }
          {
            text = "Locked";
            color = "rgba(125, 207, 255, 0.6)";
            font_size = 16;
            font_family = "JetBrains Mono Nerd Font";
            position = "0, -230";
            halign = "center";
            valign = "center";
          }
          {
            text = ''cmd[update:60000] echo " $(uptime -p | sed 's/up //')"'';
            color = "rgba(192, 202, 245, 0.6)";
            font_size = 12;
            font_family = "JetBrains Mono Nerd Font";
            position = "20, -20";
            halign = "left";
            valign = "top";
          }
          {
            text = ''cmd[update:1000] echo "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main) | .active_keymap' | head -n1 || echo 'US')"'';
            color = "rgba(224, 175, 104, 0.8)";
            font_size = 12;
            font_family = "JetBrains Mono Nerd Font";
            position = "-20, 30";
            halign = "right";
            valign = "bottom";
          }
          {
            text = "Hi, $USER";
            color = "rgba(192, 202, 245, 1.0)";
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
