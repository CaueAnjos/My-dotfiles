{
  vim = {
    ui.fastaction.enable = true;
    lsp.mappings.codeAction = null;
    keymaps = [
      {
        key = "<leader>la";
        mode = ["n" "x"];
        silent = true;
        action = "<cmd>lua require('fastaction').code_action()<CR>";
      }
    ];
  };
}
