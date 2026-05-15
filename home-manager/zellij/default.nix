{config, ...}: let
  inherit (config.colorScheme) palette;
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
      keybinds = {
        unbind._args = ["Ctrl g" "Ctrl p" "Ctrl n" "Ctrl o" "Ctrl t"];
        pane = {
          _children = [
            {
              bind = {
                _args = ["q"];
                _children = [
                  {
                    CloseFocus._args = [];
                    SwitchToMode._args = ["Normal"];
                  }
                ];
              };
            }
          ];
        };
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
    };
  };
}
