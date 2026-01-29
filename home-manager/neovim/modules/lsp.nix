{
  imports = [
    ./languages
  ];

  programs.nvf.settings.vim = {
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
  };
}
