{
  vim.keymaps = [
    # Notifications
    {
      desc = "Find Notification";
      key = "<leader>fn";
      mode = "n";
      silent = true;
      action = "<cmd>NoiceTelescope<CR>";
    }
    {
      desc = "Notification";
      key = "<leader>n";
      mode = "n";
      silent = true;
      action = "<cmd>Noice<CR>";
    }

    # NOTE: this is used to remove highlights after search
    {
      desc = "Clear highlights";
      key = "<Esc>";
      mode = "n";
      action = "<cmd>nohlsearch<CR>";
    }
  ];
}
