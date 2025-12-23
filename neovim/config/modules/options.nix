{
  vim.options = {
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;
    autoindent = false;
    clipboard = "unnamed";
    ignorecase = true;
    smartcase = true;
  };

  vim.globals = {
    clipboard = {
      name = "Clipboard";
      copy = {
        "+" = "cb copy";
        "*" = "cb copy";
      };
      paste = {
        "+" = "cb paste";
        "*" = "cb paste";
      };
      cache_enabled = false;
    };
    have_nerd_font = true;
  };
}
