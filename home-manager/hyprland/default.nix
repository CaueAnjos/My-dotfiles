{
  inputs,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  wayland.windowManager.hyprland = {
    package = inputs.hyperland.packages.${pkgs.system}.hyprland;
    enable = true;
    systemd.enable = false;
    settings = {
      on = let
        mkHook = event: luaExpr: {
          _args = [
            event
            (
              mkLuaInline ''
                function()
                    ${luaExpr}
                end
              ''
            )
          ];
        };
      in [
        (mkHook "hyprland.start" ''
          hl.exec_cmd('noctalia')
        '')
      ];

      monitor = [
        {
          output = "DP-2";
          mode = "1920x1080@144";
          position = "-1920x0";
          scale = 1;
        }
        {
          output = "DP-1";
          mode = "1920x1080@300";
          position = "0x0";
          scale = 1;
        }
      ];

      config = {
        input = {
          kb_layout = "us,br";
          kb_options = "grp:alt_shift_toggle";
        };

        general = {
          gaps_in = 4;
          gaps_out = 4;
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
            new_optimizations = true;
            ignore_opacity = true;
            xray = true;
          };

          shadow = {
            enabled = true;
            range = 30;
            render_power = 3;
          };
        };
      };

      animation = let
        mkAnimation = leaf: args:
          {
            inherit leaf;
            enabled = true;
          }
          // args;
      in [
        (mkAnimation "windows" {
          speed = 6;
          bezier = "wind";
          style = "slide";
        })
        (mkAnimation "windowsIn" {
          speed = 6;
          bezier = "winIn";
          style = "slide";
        })
        (mkAnimation "windowsOut" {
          speed = 5;
          bezier = "winOut";
          style = "slide";
        })
        (mkAnimation "windowsMove" {
          speed = 5;
          bezier = "wind";
          style = "slide";
        })
        (mkAnimation "workspaces" {
          speed = 5;
          bezier = "wind";
        })
        (mkAnimation "fade" {
          speed = 10;
          bezier = "default";
        })
      ];

      curve = let
        mkCurve = name: args: {
          _args = [name args];
        };
      in [
        (mkCurve "wind" {
          type = "bezier";
          points = [[0.05 0.9] [0.1 1.05]];
        })
        (mkCurve "winIn" {
          type = "bezier";
          points = [[0.1 1.1] [0.1 1.1]];
        })
        (mkCurve "winOut" {
          type = "bezier";
          points = [[0.3 (-0.3)] [0 1]];
        })
        (mkCurve "liner" {
          type = "bezier";
          points = [[1 1] [1 1]];
        })
      ];

      bind = let
        mkBind = key: luaExpr: {
          _args = [
            key
            (mkLuaInline luaExpr)
          ];
        };

        mkVimDirectionalBind = mod: luaExpr: let
          toDiraction = {
            "h" = "l";
            "j" = "d";
            "k" = "u";
            "l" = "r";
          };
        in
          builtins.map (
            bind:
              mkBind (mod + "+" + bind) "${luaExpr}({ direction = '${toDiraction.${bind}}' })"
          ) ["h" "j" "k" "l"];
      in
        [
          (mkBind "SUPER + ALT" "hl.dsp.window.resize()")
          (mkBind "SUPER + d" "hl.dsp.window.kill()")
          (mkBind "SUPER + f" "hl.dsp.window.fullscreen({ action = 'toggle', mode = 'maximized' })")
        ]
        ++ (mkVimDirectionalBind "SUPER" "hl.dsp.focus")
        ++ (mkVimDirectionalBind "SUPER + SHIFT" "hl.dsp.window.move")
        ++ (builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              (mkBind "SUPER + code:1${toString i}" "hl.dsp.focus({ workspace = ${toString ws} } )")
              (mkBind "SUPER + SHIFT + code:1${toString i}" "hl.dsp.window.move({ workspace = ${toString ws} } )")
            ]
          )
          9));
    };
  };
}
