{
  pkgs,
  config,
  ...
}: {
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
