{
  pkgs,
  config,
  ...
}: let
  inherit (config.colorScheme) palette;
in {
  programs.nvf.settings.vim = {
    lazy.plugins = {
      "transparent.nvim" = {
        package = pkgs.vimPlugins.transparent-nvim;
        event = "BufEnter";
        priority = 1000;
        setupModule = "transparent";
        setupOpts = {
          extra_groups = [
            "FloatBorder"
            "GitSignsAdd"
            "GitSignsChange"
            "GitSignsDelete"
            "GitSignsChangedelete"
            "GitSignsTopdelete"
            "GitSignsUntracked"
            "GitSignsAddNr"
            "ErrorMsg"
          ];
          exclude_groups = [
            "StatusLine"
            "StatusLineNC"
            "NotifyBackground"
          ];
        };
        after =
          /*
          lua
          */
          ''
            require("notify").setup({
                    background_colour = "#000000",
                    })
            vim.cmd('TransparentEnable')


            -- Better Theme!
            local groups = {
                ["@field"] = {fg = "#${palette.base0D}"},
                ["@parameter"] = {fg = "#${palette.base0A}", italic = true},
                ["@variable"] = {fg = "#${palette.base04}"},
                ["@keyword"] = {fg = "#${palette.base0E}", italic = true},
                ["@keyword.import"] = {fg = "#${palette.base0E}", italic = true},
                ["@type"] = {fg = "#${palette.base0C}"},
                ["@operator"] = {fg = "#${palette.base09}"},

                -- lsp
                ["@lsp.type.property"] = {link = "@field"},
                ["@lsp.type.variable"] = {link = "@variable"},
                ["@lsp.type.interface"] = {link = "@type"},
                ["@lsp.type.class"] = {link = "@type"},
                ["@lsp.type.namespace"] = {link = "@type"},
            }

            -- add highlights
            for group, settings in pairs(groups) do
                vim.api.nvim_set_hl(0, group, settings)
            end
          '';
      };
    };

    theme = {
      enable = true;
      name = "base16";
      base16-colors = config.colorScheme.palette;
      transparent = true;
    };

    statusline.lualine = {
      enable = true;
      activeSection.a = [
        /*
        lua
        */
        ''
          {
            "mode",
            icons_enabled = true,
            separator = {
              left = '▎',
              right = ''
            },
          }
        ''
        /*
        lua
        */
        ''
          {
            function()
              local reg = vim.fn.reg_recording()
                if reg == "" then
                  return ""
                end
              return "@" .. reg
             end,
          }
        ''
        /*
        lua
        */
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
      ];
    };
  };
}
