{pkgs, ...}: {
  vim.lazy.plugins = {
    "tiny-inline-diagnostic.nvim" = {
      package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
      event = "BufEnter";
      priority = 1000;
      setupModule = "tiny-inline-diagnostic";
      setupOpts = {};
      after = "vim.diagnostic.config({ virtual_text = false })";
    };
  };
}
