{config, ...}: let
  inherit (config.colorScheme) palette;

  mkArgs = _args: {inherit _args;};
  mkChildren = _children: {inherit _children;};
  option = args: children: (mkArgs args) // (mkChildren children);
in {
  programs.zellij = {
    enable = true;
    layouts.dev.layout = {
      default_tab_template._children = [
        {
          children = {};
          pane = {
            size = 1;
            borderless = true;
            plugin = {
              location = "https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm";

              format_left = "{mode} #[fg=#${palette.base0D},bold]{session}";
              format_center = "{tabs}";
              format_right = "{command_git_branch} {mode}";
              format_space = "";

              border_enabled = "false";
              border_char = "─";
              border_format = "#[fg=#6C7086]{char}";
              border_position = "top";

              hide_frame_for_single_pane = "true";

              mode_normal = "#[bg=blue]";
              mode_tmux = "#[bg=#ffc387]";

              tab_normal = "#[fg=#6C7086] {name}";
              tab_active = "#[fg=#9399B2,bold,italic] {name}";

              command_git_branch_command = "git rev-parse --abbrev-ref HEAD";
              command_git_branch_format = "#[fg=blue] {stdout}";
              command_git_branch_interval = "10";
              command_git_branch_rendermode = "static";
            };
          };
        }
      ];
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
                MessagePlugin = option ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"] [
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
