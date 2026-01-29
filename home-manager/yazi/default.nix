{config, ...}: let
  inherit (config.colorScheme) palette;
in {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    theme = {
      tabs = {
        active = {
          fg = "#${palette.base00}";
          bg = "#${palette.base0D}";
        };
        inactive = {
          fg = "#${palette.base0D}";
          bg = "#${palette.base00}";
        };
      };
      mode = {
        normal_main = {
          fg = "#${palette.base00}";
          bg = "#${palette.base0D}";
          bold = true;
        };
        select_main = {
          fg = "#${palette.base00}";
          bg = "#${palette.base0B}";
          bold = true;
        };
        unset_main = {
          fg = "#${palette.base00}";
          bg = "#${palette.base08}";
          bold = true;
        };
      };
      indicator = let
        default = {
          fg = "#${palette.base01}";
          bg = "#${palette.base0B}";
        };
      in {
        parent = default;
        current = default;
        preview = default;
        padding = {
          open = "█";
          close = "";
        };
      };
      mgr = {
        cwd.fg = "#${palette.base0D}";
        find_keyword = {
          fg = "#${palette.base02}";
          bg = "#${palette.base0B}";
          italic = true;
          underline = true;
        };

        marker_selected = {
          fg = "#${palette.base0B}";
          bg = "#${palette.base0B}";
        };
        marker_copied = {
          fg = "#${palette.base0A}";
          bg = "#${palette.base0A}";
        };
        marker_cut = {
          fg = "#${palette.base08}";
          bg = "#${palette.base08}";
        };

        border_symbol = "│";
        border_style = {fg = "#${palette.base03}";};
      };

      status = {
        overal = {
          fg = "#${palette.base00}";
          bg = "#${palette.base00}";
        };

        permissions_t = {fg = "#${palette.base0B}";};
        permissions_r = {fg = "#${palette.base0A}";};
        permissions_w = {fg = "#${palette.base08}";};
        permissions_x = {fg = "#${palette.base0C}";};
        permissions_s = {fg = "#${palette.base03}";};
      };

      select = {
        border = {fg = "#${palette.base0D}";};
        active = {fg = "#${palette.base0E}";};
        inactive = {fg = "#${palette.base05}";};
      };

      input = {
        border = {fg = "#${palette.base0D}";};
        title = {};
        value = {};
        selected = {reversed = true;};
      };

      completion = {
        border = {fg = "#${palette.base0D}";};
        active = {bg = "#${palette.base02}";};
        inactive = {};
      };

      tasks = {
        border = {fg = "#${palette.base0D}";};
        title = {};
        hovered = {underline = true;};
      };

      which = {
        cols = 3;
        mask = {bg = "#${palette.base01}";};
        cand = {fg = "#${palette.base0C}";};
        rest = {fg = "#${palette.base04}";};
        desc = {fg = "#${palette.base0E}";};
        separator = "  ";
        separator_style = {fg = "#${palette.base03}";};
      };

      help = {
        on = {fg = "#${palette.base0E}";};
        exec = {fg = "#${palette.base0C}";};
        desc = {fg = "#${palette.base04}";};
        hovered = {
          bg = "#${palette.base02}";
          bold = true;
        };
        footer = {
          fg = "#${palette.base03}";
          bg = "#${palette.base01}";
        };
      };

      filetype = {
        rules = [
          {
            mime = "image/*";
            fg = "#${palette.base0C}";
          }

          {
            mime = "video/*";
            fg = "#${palette.base0E}";
          }
          {
            mime = "audio/*";
            fg = "#${palette.base0C}";
          }

          {
            mime = "application/zip";
            fg = "#${palette.base09}";
          }
          {
            mime = "application/gzip";
            fg = "#${palette.base09}";
          }
          {
            mime = "application/x-tar";
            fg = "#${palette.base09}";
          }
          {
            mime = "application/x-bzip";
            fg = "#${palette.base09}";
          }
          {
            mime = "application/x-bzip2";
            fg = "#${palette.base09}";
          }
          {
            mime = "application/x-7z-compressed";
            fg = "#${palette.base09}";
          }
          {
            mime = "application/x-rar";
            fg = "#${palette.base09}";
          }

          {
            mime = "application/pdf";
            fg = "#${palette.base08}";
          }
          {
            name = "*.doc";
            fg = "#${palette.base0D}";
          }
          {
            name = "*.docx";
            fg = "#${palette.base0D}";
          }
          {
            name = "*.xls";
            fg = "#${palette.base0B}";
          }
          {
            name = "*.xlsx";
            fg = "#${palette.base0B}";
          }

          {
            name = "*.py";
            fg = "#${palette.base0A}";
          }
          {
            name = "*.js";
            fg = "#${palette.base0A}";
          }
          {
            name = "*.ts";
            fg = "#${palette.base0A}";
          }
          {
            name = "*.rs";
            fg = "#${palette.base09}";
          }
          {
            name = "*.go";
            fg = "#${palette.base0C}";
          }
          {
            name = "*.c";
            fg = "#${palette.base0D}";
          }
          {
            name = "*.cpp";
            fg = "#${palette.base0D}";
          }
          {
            name = "*.h";
            fg = "#${palette.base0D}";
          }

          {
            name = "*.json";
            fg = "#${palette.base0A}";
          }
          {
            name = "*.toml";
            fg = "#${palette.base0E}";
          }
          {
            name = "*.yaml";
            fg = "#${palette.base0E}";
          }
          {
            name = "*.yml";
            fg = "#${palette.base0E}";
          }

          {
            name = "*";
            fg = "#${palette.base05}";
          }
          {
            name = "*/";
            fg = "#${palette.base0D}";
          }
        ];
      };

      icons = {
        "Desktop/" = "";
        "Documents/" = "";
        "Downloads/" = "";
        "Pictures/" = "";
        "Music/" = "";
        "Videos/" = "";
        "Public/" = "";
        "Development/" = "";
        ".config/" = "";
        ".git/" = "";
      };
    };
  };
}
