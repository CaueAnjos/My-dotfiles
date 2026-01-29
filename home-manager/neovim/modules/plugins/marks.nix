{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "marks.nvim" = {
      package = pkgs.vimPlugins.marks-nvim;
      event = "BufEnter";
      setupModule = "marks";
      setupOpts = {};
    };
  };
}
