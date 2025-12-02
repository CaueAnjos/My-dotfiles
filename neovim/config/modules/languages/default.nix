{
  vim.formatter.conform-nvim = {
    enable = true;
    setupOpts = {
      formatters_by_ft = {
        cs = [
          "csharpier"
        ];
      };
    };
  };

  vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;
    enableDAP = true;

    csharp.enable = true;
    go.enable = true;

    nix = {
      enable = true;
      lsp.server = "nixd";
    };

    markdown.enable = true;
    bash.enable = true;
  };
}
