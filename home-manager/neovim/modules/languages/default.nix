{
  programs.nvf.settings.vim = {
    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          cs = [
            "csharpier"
          ];
        };
      };
    };

    treesitter.indent.enable = false;

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      csharp.enable = true;
      html.enable = true;
      css.enable = true;
      ts.enable = true;
      go.enable = true;
      nix.enable = true;
      lua.enable = true;

      markdown.enable = true;
      bash.enable = true;
    };
  };
}
