{config, ...}: let
  inherit (config.colorScheme) palette;

  mkArgs = _args: {inherit _args;};
  mkChildren = _children: {inherit _children;};
  option = args: children: (mkArgs args) // (mkChildren children);

  pluginsHome = ./plugins;
in {
  programs.zellij = {
    enable = true;
    layouts.dev.layout = {
      default_tab_template = {
        children = [];
        pane = {
          size = 1;
          borderless = true;
          plugin = {
            location = "file:${pluginsHome}/zjstatus.wasm";

            border_enabled = "false";
            border_char = "─";
            border_format = "#[fg=#6C7086]{char}";
            border_position = "top";

            format_left = "{mode} #[fg=#${palette.base0D},bold]{session}";
            format_center = "{tabs}";
            format_right = "{mode}";
            format_space = "";

            hide_frame_for_single_pane = true;

            tab_normal = "#[fg=#6C7086] {name}";
            tab_active = "#[fg=#9399B2,bold,italic] {name}";

            mode_normal = "#[bg=#89B4FA] {name} ";
            mode_locked = "#[bg=#89B4FA] {name} ";
            mode_resize = "#[bg=#89B4FA] {name} ";
            mode_pane = "#[bg=#89B4FA] {name} ";
            mode_tab = "#[bg=#89B4FA] {name} ";
            mode_scroll = "#[bg=#89B4FA] {name} ";
            mode_enter_search = "#[bg=#89B4FA] {name} ";
            mode_search = "#[bg=#89B4FA] {name} ";
            mode_rename_tab = "#[bg=#89B4FA] {name} ";
            mode_rename_pane = "#[bg=#89B4FA] {name} ";
            mode_session = "#[bg=#89B4FA] {name} ";
            mode_move = "#[bg=#89B4FA] {name} ";
            mode_prompt = "#[bg=#89B4FA] {name} ";
            mode_tmux = "#[bg=#ffc387] {name} ";

            mode_default_to_mode = "normal";
          };
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
        unbind = option ["Ctrl g" "Ctrl p" "Ctrl n" "Ctrl o" "Ctrl t"] [];
        pane.bind = option ["q"] [
          {
            CloseFocus = [];
            SwitchToMode = "Normal";
          }
        ];
        shared_except = option ["locked"] [
          {
            bind = option ["Ctrl h"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "move_focus";
                    payload = "left";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Ctrl j"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "move_focus";
                    payload = "down";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Ctrl k"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "move_focus";
                    payload = "up";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Ctrl l"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "move_focus";
                    payload = "right";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Alt h"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "resize";
                    payload = "left";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Alt j"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "resize";
                    payload = "down";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Alt k"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "resize";
                    payload = "up";
                  }
                ];
              }
            ];
          }
          {
            bind = option ["Alt l"] [
              {
                MessagePlugin = option ["file:${pluginsHome}/vim-zellij-navigator.wasm"] [
                  {
                    name = "resize";
                    payload = "right";
                  }
                ];
              }
            ];
          }
        ];
        normal = option [] [
          {
            bind = option ["Ctrl b"] [
              {
                SwitchToMode = "pane";
              }
            ];
          }
          {
            bind = option ["Ctrl e"] [
              {
                SwitchToMode = "tab";
              }
            ];
          }
          {
            bind = option ["Ctrl x"] [
              {
                SwitchToMode = "session";
              }
            ];
          }
        ];
      };
    };
  };
}
