{
  vim.snippets.luasnip = {
    enable = true;
    customSnippets.snipmate = {
      nix = import ./customSnippets/nixSnippets.nix;
    };
  };
}
