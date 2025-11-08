{
  imports = [
    ./csharp.nix
  ];

  vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;
    enableDAP = true;

    csharp.enable = true;

    nix = {
      enable = true;
      lsp.server = "nixd";
    };

    markdown.enable = true;
    bash.enable = true;
  };
}
