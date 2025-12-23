{
  vim.git = {
    enable = true;
    gitsigns = {
      enable = true;
      codeActions.enable = false;
    };
    neogit.enable = true;
  };

  vim.terminal.toggleterm = {
    enable = true;
    lazygit.enable = true;
  };
}
