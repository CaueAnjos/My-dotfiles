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

    # Window, buffers and tabs
    {
      desc = "Close Current Window";
      key = "<leader>wq";
      mode = "n";
      action = "<cmd>q<CR>";
    }
    {
      desc = "Vertical Split Window";
      key = "<leader>w|";
      mode = "n";
      action = "<cmd>vsplit<CR>";
    }
    {
      desc = "Horizontal Split Window";
      key = "<leader>w-";
      mode = "n";
      action = "<cmd>split<CR>";
    }
  ];
}
