{config, ...}: let
  inherit (config.colorScheme) palette;

  # Helper function to convert hex color to RGB list
  hexToRgb = hex: let
    r = builtins.substring 0 2 hex;
    g = builtins.substring 2 2 hex;
    b = builtins.substring 4 2 hex;
    toInt = x: builtins.fromTOML "v=0x${x}";
  in [(toInt r).v (toInt g).v (toInt b).v];

  # Convert palette colors to RGB
  rgb = builtins.mapAttrs (name: value: hexToRgb value) palette;
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

              datetime = "#[fg=#6C7086,bold] {format} ";
              datetime_format = "%A, %d %b %Y %H:%M";
              datetime_timezone = "Europe/Berlin";
            };
          };
        }
      ];
    };
    settings = {
      keybinds = {
        unbind._args = ["Ctrl g" "Ctrl p" "Ctrl n" "Ctrl o" "Ctrl t"];
        shared_except = {
          _args = ["locked"];
          _children = [
            {
              bind = {
                _args = ["Ctrl h"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["move_focus"];
                          payload._args = ["left"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Ctrl j"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["move_focus"];
                          payload._args = ["down"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Ctrl k"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["move_focus"];
                          payload._args = ["up"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Ctrl l"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["move_focus"];
                          payload._args = ["right"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Alt h"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["resize"];
                          payload._args = ["left"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Alt j"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["resize"];
                          payload._args = ["down"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Alt k"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["resize"];
                          payload._args = ["up"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
            {
              bind = {
                _args = ["Alt l"];
                _children = [
                  {
                    MessagePlugin = {
                      _args = ["https://github.com/hiasr/vim-zellij-navigator/releases/download/0.2.1/vim-zellij-navigator.wasm"];
                      _children = [
                        {
                          name._args = ["resize"];
                          payload._args = ["right"];
                        }
                      ];
                    };
                  }
                ];
              };
            }
          ];
        };
        normal._children = [
          {
            bind = {
              _args = ["Ctrl b"];
              _children = [
                {
                  SwitchToMode._args = ["pane"];
                }
              ];
            };
          }
          {
            bind = {
              _args = ["Ctrl e"];
              _children = [
                {
                  SwitchToMode._args = ["tab"];
                }
              ];
            };
          }
          {
            bind = {
              _args = ["Ctrl x"];
              _children = [
                {
                  SwitchToMode._args = ["session"];
                }
              ];
            };
          }
          {
            bind = {
              _args = ["Ctrl ;"];
              _children = [
                {
                  SwitchToMode._args = ["move"];
                }
              ];
            };
          }
          {
            bind = {
              _args = ["Ctrl '"];
              _children = [
                {
                  SwitchToMode._args = ["resize"];
                }
              ];
            };
          }
        ];
      };

      simplified_ui = true;
      pane_frames = false;
      show_startup_tips = false;
      theme = "base16";

      themes.base16 = {
        # Unselected text (status bar text, etc)
        text_unsesasdflected = {
          base = rgb.base05;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected text (highlighted search results, etc)
        text_selected = {
          base = rgb.base05;
          background = rgb.base02;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected ribbon (inactive tabs, keybinding modes)
        ribbon_unselected = {
          base = rgb.base03;
          background = rgb.base01;
          emphasis_0 = rgb.base08;
          emphasis_1 = rgb.base09;
          emphasis_2 = rgb.base0A;
          emphasis_3 = rgb.base0B;
        };

        # Selected ribbon (active tab, current mode)
        ribbon_selected = {
          base = rgb.base00;
          background = rgb.base0D;
          emphasis_0 = rgb.base08;
          emphasis_1 = rgb.base09;
          emphasis_2 = rgb.base0A;
          emphasis_3 = rgb.base0B;
        };

        # Table title
        table_title = {
          base = rgb.base05;
          background = rgb.base01;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected table cell
        table_cell_unselected = {
          base = rgb.base05;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected table cell
        table_cell_selected = {
          base = rgb.base05;
          background = rgb.base02;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected list item
        list_unselected = {
          base = rgb.base05;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected list item
        list_selected = {
          base = rgb.base05;
          background = rgb.base02;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected frame (non-focused panes)
        frame_unselected = {
          base = rgb.base03;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected frame (focused pane)
        frame_selected = {
          base = rgb.base0D;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Highlighted frame (focused pane in special mode)
        frame_highlight = {
          base = rgb.base0A;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Exit code success indicator
        exit_code_success = {
          base = rgb.base0B;
          background = rgb.base00;
          emphasis_0 = rgb.base0B;
          emphasis_1 = rgb.base0B;
          emphasis_2 = rgb.base0B;
          emphasis_3 = rgb.base0B;
        };

        # Exit code error indicator
        exit_code_error = {
          base = rgb.base08;
          background = rgb.base00;
          emphasis_0 = rgb.base08;
          emphasis_1 = rgb.base08;
          emphasis_2 = rgb.base08;
          emphasis_3 = rgb.base08;
        };

        # Multiplayer user colors
        multiplayer_user_colors = {
          player_1 = rgb.base08;
          player_2 = rgb.base09;
          player_3 = rgb.base0A;
          player_4 = rgb.base0B;
          player_5 = rgb.base0C;
          player_6 = rgb.base0D;
          player_7 = rgb.base0E;
          player_8 = rgb.base0F;
          player_9 = rgb.base03;
          player_10 = rgb.base04;
        };
      };
    };
  };
}
