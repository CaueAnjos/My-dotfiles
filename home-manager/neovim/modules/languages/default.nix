{pkgs, ...}: {
  programs.nvf.settings.vim = {
    lsp.presets.harper.enable = true;

    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      objdump
    ];

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      csharp = {
        enable = true;
        extensions.csharpls-extended-lsp-nvim.enable = true;
        format.type = ["csharpier"];
      };

      clang.enable = true;
      html.enable = true;
      css.enable = true;
      ts.enable = true;
      go.enable = true;
      nix.enable = true;
      lua.enable = true;

      markdown.enable = true;
      bash.enable = true;
    };
  };
}
