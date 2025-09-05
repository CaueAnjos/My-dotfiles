{
  pkgs,
  pkgs-stable,
  ...
}: {
  vim = {
    extraPackages = [
      pkgs-stable.roslyn-ls
    ];

    lazy.plugins = {
      "roslyn.nvim" = {
        package = pkgs.vimPlugins.roslyn-nvim;
        ft = ["cs" "razor"];
        setupModule = "roslyn";
        setupOpts = {};
        beforeAll = "vim.lsp.enable('roslyn')";
      };
    };

    languages = {
      csharp = {
        enable = true;
        # this is set to false to not use csharp-ls or OmniSharp
        lsp.enable = false;
      };
    };
  };
}
