{
  vim.snippets.luasnip = {
    enable = true;
    customSnippets = {
      nix = import ./customSnippets/nixSnippets.nix;
    };
  };
}
