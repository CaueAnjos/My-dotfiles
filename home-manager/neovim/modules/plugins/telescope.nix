{pkgs, ...}: {
  programs.nvf.settings.vim.telescope = {
    enable = true;
    extensions = [
      {
        name = "fzf";
        packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
        setup.fzf.fuzzy = true;
      }
    ];
    setupOpts = {
      defaults = {
        path_display = ["smart"];
      };
    };
  };
}
