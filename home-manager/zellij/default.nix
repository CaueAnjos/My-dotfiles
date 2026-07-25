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

            format_left = "{mode}#[bg=#${palette.base02},fg=#${palette.base05}]  {session} #[bg=#${palette.base01},fg=#${palette.base02}]";
            format_center = "{tabs}";
            format_right = "";
            format_space = "#[bg=#${palette.base01},fg=#${palette.base01}] ";

            tab_normal = "#[bg=#${palette.base01},fg=#${palette.base03}]{index} {name}  ";
            tab_active = "#[bg=#${palette.base01},fg=#${palette.base04},bold,italic]@ {name}  ";

            mode_normal = "#[bg=#${palette.base02},fg=#${palette.base0D}]▎#[bg=#${palette.base0D},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0D}]";
            mode_locked = "#[bg=#${palette.base02},fg=#${palette.base0E}]▎#[bg=#${palette.base0E},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0E}]";
            mode_resize = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_pane = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_tab = "#[bg=#${palette.base02},fg=#${palette.base0F}]▎#[bg=#${palette.base0F},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0F}]";
            mode_scroll = "#[bg=#${palette.base02},fg=#${palette.base09}]▎#[bg=#${palette.base09},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base09}]";
            mode_enter_search = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_search = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_rename_tab = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_rename_pane = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_session = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_move = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_prompt = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";
            mode_tmux = "#[bg=#${palette.base02},fg=#${palette.base0C}]▎#[bg=#${palette.base0C},fg=#${palette.base01}] {name} #[bg=#${palette.base02},fg=#${palette.base0C}]";

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
        unbind = option ["Ctrl p" "Ctrl n" "Ctrl o" "Ctrl t"] [];
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
