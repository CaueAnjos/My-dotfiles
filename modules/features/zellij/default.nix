{
  flake.modules.homeManager.ZellijKawid = {
    config,
    lib,
    ...
  }: let
    c = config.lib.stylix.colors; # base00..base0F, no leading '#'

    mkArgs = _args: {inherit _args;};
    mkChildren = _children: {inherit _children;};
    option = args: children: (mkArgs args) // (mkChildren children);

    pluginsHome = ./plugins;
    navigator = "file:${pluginsHome}/vim-zellij-navigator.wasm";

    # zjstatus mode pill: [▎ NAME ]
    mkMode = color: let
      pill = "#[bg=#${c.base02},fg=#${color}]";
    in "${pill}▎#[bg=#${color},fg=#${c.base01},bold] {name} ${pill}";

    modeColors = {
      normal = c.base0D;
      locked = c.base08;
      resize = c.base0A;
      pane = c.base0B;
      tab = c.base0C;
      scroll = c.base09;
      session = c.base0E;
      move = c.base0A;
      prompt = c.base0C;
      tmux = c.base0B;
      enter_search = c.base0E;
      search = c.base0E;
      rename_tab = c.base0F;
      rename_pane = c.base0F;
    };

    # vim-zellij-navigator bind helper
    navBind = key: name: payload: {
      bind = option [key] [
        {
          MessagePlugin = option [navigator] [{inherit name payload;}];
        }
      ];
    };
  in {
    stylix.targets.zellij.enable = true; # themes zellij itself, sets theme = "stylix"

    programs.zellij = {
      enable = true;

      layouts.dev.layout = {
        default_tab_template = {
          children = [];
          pane = {
            size = 1;
            borderless = true;
            plugin =
              {
                location = "file:${pluginsHome}/zjstatus.wasm";

                border_enabled = "false";
                border_char = "─";
                border_format = "#[fg=#${c.base03}]{char}";
                border_position = "top";

                format_left = "{mode}#[bg=#${c.base02},fg=#${c.base05}]  {session} #[bg=#${c.base01},fg=#${c.base02}]";
                format_center = "{tabs}";
                format_right = "#[bg=#${c.base01},fg=#${c.base04}]{datetime} ";
                format_space = "#[bg=#${c.base01},fg=#${c.base01}] ";

                tab_normal = "#[bg=#${c.base01},fg=#${c.base03}] {index} {name} ";
                tab_active = "#[bg=#${c.base02},fg=#${c.base0D},bold] {index} {name} ";
                tab_active_fullscreen = "#[bg=#${c.base02},fg=#${c.base0A},bold] {index} {name} [] ";
                tab_sync = "#[bg=#${c.base01},fg=#${c.base0E}] {index} {name} <> ";

                datetime = "{format}";
                datetime_format = "%H:%M";
                datetime_timezone = "America/Sao_Paulo";

                mode_default_to_mode = "normal";
              }
              // lib.mapAttrs' (n: col: lib.nameValuePair "mode_${n}" (mkMode col)) modeColors;
          };
        };
      };

      settings = {
        # basic
        on_force_close = option ["quit"] [];
        simplified_ui = option [true] [];
        pane_frames = option [false] [];
        show_startup_tips = option [false] [];
        default_layout = option ["dev"] [];
        mouse_mode = option [true] [];
        osc8_hyperlinks = option [true] [];
        focus_follows_mouse = option [true] [];

        # clipboard
        copy_on_select = option [true] [];

        # UI
        ui.pane_frames.rounded_corner = option [true] [];

        # serialization
        session_serialization = option [true] [];
        pane_viewport_serialization = option [true] [];

        keybinds = {
          unbind = option ["Ctrl p" "Ctrl n" "Ctrl o" "Ctrl t"] [];
          pane.bind = option ["q"] [
            {
              CloseFocus = [];
              SwitchToMode = "Normal";
            }
          ];
          shared_except = option ["locked"] [
            (navBind "Ctrl h" "move_focus" "left")
            (navBind "Ctrl j" "move_focus" "down")
            (navBind "Ctrl k" "move_focus" "up")
            (navBind "Ctrl l" "move_focus" "right")
            (navBind "Alt h" "resize" "left")
            (navBind "Alt j" "resize" "down")
            (navBind "Alt k" "resize" "up")
            (navBind "Alt l" "resize" "right")
          ];
          normal = option [] [
            {bind = option ["Ctrl b"] [{SwitchToMode = "pane";}];}
            {bind = option ["Ctrl e"] [{SwitchToMode = "tab";}];}
            {bind = option ["Ctrl x"] [{SwitchToMode = "session";}];}
          ];
        };
      };
    };
  };
}
