{
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      lightbulb = {
        enable = true;
        setupOpts = {
          sign = {
            text = "";
            lens_text = "";
          };
        };
      };
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
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
      csharp = {
        enable = true;
        lsp.server = "omnisharp";
      };
    };
  };
}
