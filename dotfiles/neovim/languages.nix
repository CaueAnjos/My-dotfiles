{
  enableFormat = true;
  enableTreesitter = true;
  enableExtraDiagnostics = true;
  enableDAP = true;

  nix = {
    enable = true;
    lsp.server = "nixd";
  };

  markdown.enable = true;
  bash.enable = true;
  csharp.enable = true;
}
