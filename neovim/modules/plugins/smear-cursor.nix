{pkgs, ...}: {
  vim.lazy.plugins = {
    "smear-cursor.nvim" = {
      package = pkgs.vimPlugins.smear-cursor-nvim;
      event = "BufEnter";
      setupModule = "smear_cursor";
    };
  };
}
