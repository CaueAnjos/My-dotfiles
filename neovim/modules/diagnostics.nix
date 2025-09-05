{
  pkgs,
  lib,
  ...
}: {
  vim.lazy.plugins = {
    "tiny-inline-diagnostic.nvim" = {
      package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
      event = "BufEnter";
      priority = 1000;
      setupModule = "tiny-inline-diagnostic";
      setupOpts = {};
    };
  };

  vim.diagnostics = {
    enable = true;
    config = {
      # this need to be false for the plugins above to work
      virtual_text = false;
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
  };
}
