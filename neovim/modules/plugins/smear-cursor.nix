{pkgs, ...}: {
  vim.extraPlugins = {
    "smear-cursor.nvim" = {
      package = pkgs.vimPlugins.smear-cursor-nvim;
      setup = "require('smear_cursor').setup {}";
    };
  };
}
