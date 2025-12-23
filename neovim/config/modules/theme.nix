let
  name = "tokyonight";
  style = "moon";
in {
  vim.theme = {
    enable = true;
    inherit name;
    inherit style;
    transparent = true;
  };

  vim.statusline.lualine = {
    enable = true;
    theme = name;
    activeSection.a = [
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
      ''
        {
          "",
          draw_empty = true,
          separator = { left = '', right = '' }
        }
      ''
    ];
  };
}
