{pkgs, ...}: {
  config.vim = {
    lsp.presets.harper.enable = true;

    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      objdump
    ];

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      csharp = {
        enable = true;
        lsp.servers = ["roslyn-ls"];
        extensions.roslyn-nvim.enable = true;
        format.type = ["csharpier"];
      };

      clang.enable = true;
      html.enable = true;
      css.enable = true;
      typescript.enable = true;
      go.enable = true;
      nix.enable = true;
      lua.enable = true;
      tex.enable = true;
      dart = {
        enable = true;
        flutter-tools.enable = true;
      };

      markdown.enable = true;
      bash.enable = true;
    };
  };
}
