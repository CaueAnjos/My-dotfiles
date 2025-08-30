lib: {
  enable = true;
  config = {
    virtual_text = false;
    virtual_lines = true;
    update_in_insert = true;
    signs = {
      text = lib.mkLuaInline ''
        {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.HINT] = " ",
        }
      '';
      linehl = lib.mkLuaInline ''
        {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        }
      '';
      numhl = lib.mkLuaInline ''
        {
             [vim.diagnostic.severity.WARN] = 'WarningMsg',
        }
      '';
    };
  };
}
