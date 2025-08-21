{ pkgs, ... }:
{
  home.packages = with pkgs; [
    csharpier
    lua-language-server
    nil
    omnisharp-roslyn
    stylua
    sqlfluff
    shfmt
    netcoredbg
    vscode-json-languageserver
  ];

  home.shellAliases = {
    omnisharp = "OmniSharp";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file.".config/nvim".source = ./dotfiles/nvim;
}
